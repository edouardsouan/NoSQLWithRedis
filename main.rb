require 'redis'
require './worker'

Redis 
redis = Redis.new

worker = Worker.new()
worker.addJob('getGoogle', 'https://www.google.fr')
sleep 10
worker.addJob('getRedis','http://www.redis.io')