USAGE: 

1. get redis setup somehow

docker run -p 6379:6379 --name redis-7.0 -it --rm redis:7.0-rc1

OR 

run in a VM and install based on OSS site

2. load function into redis DB

cat /path/to/<mylib.lua> | redis-cli -x FUNCTION LOAD Lua <function_name> replace

3. interact with function through command line

> FCALL <my_hset> 1 foo k1 v1 k2 v2
3

> HGETALL foo
1) "k1"
2) "v1"
3) "k2"
4) "v2"
5) "_updated_at"
6) "1643581494"

> FCALL <my_hset> 1 foo k4 v4
1

> HGETALL foo
1) "k1"
2) "v1"
3) "k2"
4) "v2"
5) "_updated_at"
6) "1643581580"
7) "k4"
8) "v4"



