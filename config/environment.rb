require 'bundler'
Bundler.require(:default)

require 'yaml'
require 'active_record'
require 'byebug'
require_relative '../api'
require_relative '../db/tianyan'
require_relative '../common/tiany'
require_relative './settings'

Settings.load("config/settings.yml")
test_env = ENV['RACK_ENV'] == 'test'
databases = Settings.values[:databases]
ActiveRecord::Base.establish_connection(
  adapter:  databases[:adapter],
  database: test_env ? databases[:test] : databases[:default]
)

ActiveRecord::Base.connection.instance_eval do
  create_table :tianyans, if_not_exists: true do |t|
    t.string :name
    t.string :type
    t.string :base
    t.string :historyNames
    t.string :regStatus
    t.string :regCapital
    t.string :city
    t.string :staffNumRange
    t.string :bondNum
    t.string :legalPersonName
    t.string :revokeReason
    t.string :regNumber
    t.string :creditCode
    t.string :property3
    t.string :usedBondName
    t.string :actualCapitalCurrency
    t.string :alias
    t.string :companyOrgType
    t.string :cancelReason
    t.string :orgNumber
    t.string :email
    t.string :actualCapital
    t.string :regInstitute
    t.string :businessScope
    t.string :taxNumber
    t.string :regLocation
    t.string :regCapitalCurrency
    t.string :tags
    t.string :websiteList
    t.string :phoneNumber
    t.string :district
    t.string :bondType
    t.string :resultName
    t.string :industry
    t.string :bondName
    t.integer :cancelDate
    t.integer :revokeDate
    t.integer :resultType
    t.integer :updateTimes
    t.integer :approvedTime
    t.integer :fromTime
    t.integer :socialStaffNum
    t.integer :estiblishTime
    t.integer :toTime
    t.integer :percentileScore
    t.integer :isMicroEnt
    t.text :industryAll
    t.text :historyNameList
    t.timestamps
  end
  # add_index(:tianyans, :name, unique: true, if_not_exists: true)
end
