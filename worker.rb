require 'redis'
require 'json'
require 'net/http'

class Worker
	def  storeJob(serializedJob)
		redis = Redis.new
		redis.lpush("jobsList", serializedJob)
	end

	def serializeJobInJSON()
			return {'jobName' => @name, 'action' => @action}.to_json
	end

	def addJob(name,action)
		@name = name
		@action = action
		serializedJob = self.serializeJobInJSON()
		self.storeJob(serializedJob)
	end
end

class CrawlerWorker < Worker
	def start()
		while true do
			redis = Redis.new
			currentJob = redis.rpop("jobsList")

			if !currentJob.nil?
				parsedJob = JSON.parse(currentJob)
				currentJobName = parsedJob["jobName"]
				currentjobAction = parsedJob["action"]

				puts "#{currentJobName} is running"

				displayWebSiteTitle(currentjobAction)

			end
			sleep 5
		end
	end

	def displayWebSiteTitle(url)
		result = Net::HTTP.get_response(URI.parse(url)).body
		puts result
	end
end