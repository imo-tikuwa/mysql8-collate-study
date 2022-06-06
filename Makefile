init:
	docker-compose up -d --build
db:
	docker-compose exec db bash
connect-db:
	docker-compose exec db mysql testdb
down-all:
	docker-compose down --rmi all --volumes --remove-orphans

# テーブルやカラムにCOLLATEを指定しないとどうなるかt1とt2で確認
check-t1-t2-diff:
	docker-compose exec db bash -c "diff --color <(mysql testdb -e 'show create table t1' --silent --skip-column-names --raw) <(mysql testdb -e 'show create table t2' --silent --skip-column-names --raw)"

# t1～t4の各テーブルに追加した3レコードについてc1 = c2の結果を確認
# t1 = utf8mb4_bin
# t2 = utf8mb4_0900_ai_ci
# t3 = utf8mb4_general_ci
# t4 = utf8mb4_0900_as_ci
check-c1-c2-equal:
	docker-compose exec db bash -c "mysql testdb -e 'SELECT * FROM t1 WHERE c1 = c2'"
	docker-compose exec db bash -c "mysql testdb -e 'SELECT * FROM t2 WHERE c1 = c2'"
	docker-compose exec db bash -c "mysql testdb -e 'SELECT * FROM t3 WHERE c1 = c2'"
	docker-compose exec db bash -c "mysql testdb -e 'SELECT * FROM t4 WHERE c1 = c2'"