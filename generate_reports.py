import sqlite3
import os

DB_PATH = ':memory:'
SQL_DIR = 'database'
OUTPUT_DIR = 'images'
QUERY_FILE = os.path.join(SQL_DIR, 'queries.sql')
INIT_FILES = ['create_tables.sql', 'insert_data.sql']

HTML_TEMPLATE = """
<!DOCTYPE html>
<html>
<head>
<style>
    body {{ font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; padding: 20px; background-color: #f0f0f0; }}
    table {{ border-collapse: collapse; width: 100%; background: white; box-shadow: 0 1px 3px rgba(0,0,0,0.2); }}
    th, td {{ padding: 12px 15px; text-align: left; border-bottom: 1px solid #ddd; }}
    th {{ background-color: #f8f9fa; font-weight: 600; color: #333; border-bottom: 2px solid #ddd; }}
    tr:hover {{ background-color: #f5f5f5; }}
    .query-title {{ margin-bottom: 10px; color: #555; font-size: 14px; }}
</style>
</head>
<body>
    <div class="query-title">Result for: {title}</div>
    <table>
        <thead>
            <tr>{headers}</tr>
        </thead>
        <tbody>
            {rows}
        </tbody>
    </table>
</body>
</html>
"""

def execute_sql_file(cursor, filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        sql_content = f.read()
    
    statements = sql_content.split(';')
    for stmt in statements:
        if stmt.strip():
            try:
                cursor.execute(stmt)
            except Exception as e:
                print(f"Error executing statement in {filepath}: {e}")
                print(f"Statement: {stmt[:100]}...")

def run_queries_and_export(cursor):
    with open(QUERY_FILE, 'r', encoding='utf-8') as f:
        content = f.read()

    queries = []
    
    raw_queries = content.split(';')
    
    item_index = 1
    for raw_q in raw_queries:
        if not raw_q.strip():
            continue
            
        title = f"Query {item_index}"
        lines = raw_q.strip().split('\n')
        
        clean_sql = '\n'.join(lines)
        
        if not clean_sql.strip():
            continue

        try:
            cursor.execute(clean_sql)
            columns = [description[0] for description in cursor.description]
            results = cursor.fetchall()
            
            headers_html = ''.join(f'<th>{col}</th>' for col in columns)
            rows_html = ''
            for row in results:
                rows_html += '<tr>' + ''.join(f'<td>{str(cell)}</td>' for cell in row) + '</tr>'
            
            complete_html = HTML_TEMPLATE.format(title=title, headers=headers_html, rows=rows_html)
            
            out_filename = f"query_results_{item_index}.html"
            out_path = os.path.join(OUTPUT_DIR, out_filename)
            with open(out_path, 'w', encoding='utf-8') as out_f:
                out_f.write(complete_html)
            
            print(f"Generated {out_path}")
            item_index += 1
            
        except Exception as e:
            print(f"Error executing query {item_index}: {e}")
            print(f"SQL: {clean_sql}")

def main():
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    print("Initializing Database...")
    for init_file in INIT_FILES:
        path = os.path.join(SQL_DIR, init_file)
        print(f"Executing {path}...")
        execute_sql_file(cursor, path)
        
    print("Running Reporting Queries...")
    if not os.path.exists(OUTPUT_DIR):
        os.makedirs(OUTPUT_DIR)
        
    run_queries_and_export(cursor)
    conn.close()
    print("Done.")

if __name__ == "__main__":
    main()
