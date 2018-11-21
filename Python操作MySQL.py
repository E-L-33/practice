#coding:utf-8
#利用Python操作MySQL的一些简单CURD操作
#数据库结构 库名shop，仅对shop/shop表进行操作
#mysql> desc shop;
#+----------+------------+------+-----+---------+-------+
#| Field    | Type       | Null | Key | Default | Extra |
#+----------+------------+------+-----+---------+-------+
#| id       | int(10)    | NO   | PRI | NULL    |       |
#| name     | varchar(5) | YES  |     | NULL    |       |
#| price    | int(5)     | YES  |     | NULL    |       |
#| stock    | int(5)     | YES  |     | NULL    |       |
#| man_date | date       | YES  |     | NULL    |       |
#+----------+------------+------+-----+---------+-------+

import pymysql

def index():
	print('|'+' '*42+'|')
	print('|'+' '*42+'|')
	print('|'+'-'*42+'|')
	print('|'+' '*42+'|')
	print('|          直接选还是走流程？？？          |')

	print('|'+' '*42+'|')
	print('|            有本事你输个数试试            |')
	print('|'+' '*42+'|')
	print('|'+'-'*42+'|')
	print('|'+' '*42+'|')
	print('|       1、查询商品      2、增加商品       |')
	print('|'+' '*42+'|')
	print('|'+'-'*42+'|')
	print('|'+' '*42+'|')
	print('|       3、修改商品      4、删除商品       |')
	print('|'+' '*42+'|')
	print('|'+'-'*42+'|')
	print('|'+' '*42+'|')
	print('|'+' '*42+'|')

	operation = int(input('------>:'))    #接受键盘操作数,需要对接收的数据进行判断和异常处理
	return operation

#连接数据库
def connect():
	#连接数据库返回游标
	conn = pymysql.connect(host='localhost', user='root', passwd='1', port=3306, db='shop', charset='utf8')
	cur = conn.cursor()
	return cur,conn


#增删改查
def create(cur,conn):
	sid = int(input('------>'+'\n'+'请输入商品ID：'))
	sname = input('------>'+'\n'+'请输入商品名称：')
	sprice = int(input('------>'+'\n'+'请输入商品价格：'))
	stock = int(input('------>'+'\n'+'请输入商品库存：'))
	man_date = input('------>'+'\n'+'请输入商品生产日期(xxxx-xx-xx)：')
	cur.execute("INSERT INTO shop VALUES({},'{}',{},{},'{}');".format(sid,sname,sprice,stock,man_date))
	conn.commit()
	cur.execute("SELECT * FROM shop WHERE id={}".format(sid))
	data = cur.fetchall()

	print('------>'+'\n'+'已增加商品：')	
	for i in data:
		print(i)
	return_to()
	

def delete_db(cur,conn):
	print('|'+'-'*42+'|')
	print('|'+' '*42+'|')
	print('|               1、按ID删除                |')
	print('|'+' '*42+'|')
	print('|'+'-'*42+'|')
	print('|'+'-'*42+'|')
	print('|'+' '*42+'|')
	print('|               2、按名称删除              |')
	print('|'+' '*42+'|')
	print('|'+'-'*42+'|')
	print('|'+'-'*42+'|')
	print('|'+' '*42+'|')
	print('|               3、删库跑路                |')
	print('|'+' '*42+'|')
	print('|'+'-'*42+'|')
	select_num = int(input('------>'+'\n'+'请输入删除类型：'))
	selects = [1,2,3]
	if select_num == selects[0]:
		del_num = int(input('------>'+'\n'+'请输入要删除的ID：'))
		cur.execute('DELETE FROM shop WHERE id={};'.format(del_num))
		conn.commit()
		print('------>'+'\n'+'是否要查询所有数据Y/N：')
	elif select_num == selects[1]:
		print('****这种行为可能造成同名误删****')
		del_name = input('------>请输入要删除的商品名称')
		cur.execute("DELETE FROM shop WHERE name='{}';".format(del_name))
		conn.commit()
		print('------>'+'\n'+'是否要查询所有数据Y/N：')
	elif select_num == selects[2]:
		cur.execute("DELETE FROM shop;")
		conn.commit()
		print('------>'+'\n'+'是否要查询所有数据Y/N：')
	else:
		print('------>'+'\n'+'虽然我只是一个数据库也是有底线的好啵！！！')
	return_to()


def update(cur,conn):
	sid = int(input('请输入你要修改的商品ID'+'\n'+'------>:'))
	print('|'+'-'*42+'|')
	print('|'+' '*42+'|')
	print('|               **修改选项**                |')
	print('|              1:id    2:name               |')
	print('|        3:price  4:stock  5:man_date       |')
	print('|'+' '*42+'|')
	print('|'+'-'*42+'|')
	selects = {1:"id",2:"name",3:"price",4:"stock",5:"man_date"}
	select_int = int(input('要修改哪个呢？'+'\n'+'------>:'))
	select_item = selects[select_int]
	if select_int == 1 or select_int == 3 or select_int == 4:
		updates = int(input('要修改为什么呢？'+'\n'+'------>:'))
		cur.execute('UPDATE shop SET {}={} WHERE id={}'.format(select_item,updates,sid))
		conn.commit()	
	elif select_int == 2 or select_int == 5:
		updates = input('要修改为什么呢？'+'\n'+'------>:')
		cur.execute("UPDATE shop SET {}='{}' WHERE id={}".format(select_item,updates,sid))
		conn.commit()
	else:
		print('------>'+'\n'+'虽然我只是一个数据库也是有底线的好啵！！！')
	return_to()

	


#查询  遇到问题：怎么判断一个空元组  解决：其对应的布尔值为空
def select(cur,conn):
	print('|'+'-'*42+'|')
	print('|'+' '*42+'|')
	print('|    1、人口普查     2、查ID     3、点名   |')
	print('|'+' '*42+'|')
	print('|'+'-'*42+'|')
	print('|'+' '*42+'|')
	print('|    4、生产日期     5、库存     6、价格   |')
	print('|'+' '*42+'|')
	print('|'+'-'*42+'|')
	select_num = int(input('------>'+'\n'+'都在这，选一个吧:'))
	selects = [1,2,3,4,5,6]
	if select_num == selects[0]:
		cur.execute('SELECT * FROM shop;')
		data = cur.fetchall()
		for i in data:			
			print(i)

	elif select_num == selects[1]:
		sel_num = int(input('输入你要查询的ID'+'\n'+'------>：'))
		cur.execute('SELECT * FROM shop WHERE id={};'.format(sel_num))
		data = cur.fetchall()
		if data:
			for i in data:
				print(i)
		else:
			print('***您要查询的ID不存在***')

	elif select_num == selects[2]:
		sel_num = input('输入你要查询的名称'+'\n'+'------>：')
		cur.execute("SELECT * FROM shop WHERE name='{}';".format(sel_num))
		data = cur.fetchall()
		if data:
			for i in data:
				print(i)
		else:
			print('***您要查询的名称不存在***')	
				
	elif select_num == selects[3]:
		sel_num = input('输入你要查询的生产日期'+'\n'+'------>：')
		cur.execute("SELECT * FROM shop WHERE man_date='{}';".format(sel_num))
		data = cur.fetchall()
		if data:
			for i in data:
				print(i)
		else:	
			print('***您要查询的生产日期不存在***')

	elif select_num == selects[4]:
		sel_num = input('输入你要查询的库存'+'\n'+'------>：')
		cur.execute("SELECT * FROM shop WHERE stock={};".format(sel_num))
		data = cur.fetchall()
		if data:
			for i in data:
				print(i)
		else:
			print('***您要查询的库存不存在***')	

	elif select_num == selects[5]:
		sel_num = input('输入你要查询的价格'+'\n'+'------>：')
		cur.execute("SELECT * FROM shop WHERE price={};".format(sel_num))
		data = cur.fetchall()
		if data:
			for i in data:
				print(i)
		else:
			print('***您要查询的价格不存在***')

	else:
		print('------>'+'\n'+'虽然我只是一个数据库也是有底线的好啵！！！')
	return_to()
	

def return_to():
	select_s = input('返回主菜单-------R/r---或者任意键退出'+'\n'+'------>:')
	select_list = ['r','R']
	if select_s == select_list[0]:
		print('\n'+'\n'+'*****返回主页面*****'+'\n'+'\n')
		main()
	elif select_s == select_list[1]:
		print('\n'+'\n'+'*****返回主页面*****'+'\n'+'\n')
		main()
	else:
		print('\n'+'\n'+'*****山水有相逢，告辞*****'+'\n'+'\n')


#超过约束时候不会报错   eg.：int(5)   没有退出和返回
def main():
	cur,conn = connect()  #连接数据库，获得游标
	select_num = index()		#获得操作数
	selects = [1,2,3,4]
	if select_num == selects[0]:
		select(cur,conn)
	elif select_num == selects[1]:
		create(cur,conn)
	elif select_num == selects[2]:
		update(cur,conn)
	elif select_num == selects[3]:
		delete_db(cur,conn)
	else:
		print('------>虽然我只是一个数据库也是有底线的好啵！！！')
		return_to()
	cur.close()	
	conn.close()
	
main()
