# shoppingmall
12c이상 - ALTER SESSION SET "_ORACLE_SCRIPT"=true; 

oracle id/pw : jspid/jsppw

사용자 생성:
CREATE USER JSPID IDENTIFIED BY JSPPW;

사용자 권한:
GRANT CONNECT, DBA, RESOURCE TO JSPID;
