#!/usr/bin/env ruby

require 'rubygems'
require 'rest-client'
require 'json'

#parameters = JSON.parse(client['api']['hosts'][host]['parameters'].get)['results']
#search_host = JSON.parse(client['api']['hosts'].get)['results']

foreman_url = 'https://foreman.discdrive.bayphoto.com'

test = RestClient::Resource.new(foreman_url + '/api/hosts?search=params.docker-swarm-leader=true',
                                  :user     => 'api',
                                  :password => 'derpo',
                                  :headers  => { :accept => :json },
                                  :verify_ssl => false )
require 'pry';binding.pry


#puts "updating #{host}"
#
## new parameters to create
## the hash index is a work around for creating unique hash keys
## will be fixed as part of foreman API v2.
#new_parameters = { 1 =>
#                     {
#                       :name   => 'param_name',
#                       :value  => 'param value',
#                       :nested => true
#                     },
#                   2 => {
#                     :name   => 'another_param_name',
#                     :value  => 'param value 2',
#                     :nested => true
#                   }
#}
## perform the actual update
## note, running this twice with the same param name would generate an error
#client["hosts/#{host}"].put(:host => { :host_parameters_attributes => new_parameters })
