require "gitter/version"
require 'octokit'
require 'fileutils'

module Gitter

	class GithubClient
		
		def initialize(access_token)
			@client = Octokit::Client.new(:access_token => access_token)
		end

		def user()
			@client.user
		end

		def get_org_repos(type, org)
			@client.org_repos(org, type: type)
		end

		def get_repos(type=all, *org)
			@client.repos(user: user, type: type)
		end

		def get_ssh_urls(repos)
			repos.map! {|repo| repo.ssh_url}
		end

		def get_repo_dir_name(repo)
			repo[:name]
		end

		def parse_path(directory)
			directory.match('(.+\/)(.+)')
		end

		def create_destination_directory(directory)
			print "Directory not found. Creating destination for backup at: #{directory}"
			path_parts = parse_path(directory)
			Dir.chdir(path_parts[1]) { Dir.mkdir(path_parts[2]) }
		end

		def clone(url, path)
			Dir.chdir(path) do 
				system("git clone #{repo[:ssh_url]}")
			end
		end

		def update(repo, path="")
			Dir.chdir(path) do 
				Dir.chdir(repo[:name]) { system("git pull #{repo[:ssh_url]}") }
			end
		end

		def backup(repos, directory)
			if not Dir.exists?(directory)
				create_destination_directory(directory)
				repos.each {|repo| clone(repo, directory)}
			else
				Dir.chdir(directory)
				repos.each {|repo| update(repo, directory)}
			end

		end
	end

end
