# mysql -u varshita -proot -h localhost -e "USE quiz"

show(){
mysql -u varshita -proot -h localhost -e "USE quiz; select * from questions_answers;" 
}
show
