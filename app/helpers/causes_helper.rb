module CausesHelper
	def query_params(param)
		CGI.parse(URI.parse(request.original_url).query)[param.to_s][0]
	end
	def query_params?(param)
		begin
			!CGI.parse(URI.parse(request.original_url).query)[param.to_s][0].nil?
		rescue NoMethodError => e
			false
		end
	end
end
