$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require File.join(File.dirname(__FILE__),'strut/model/holder.rb')
require File.join(File.dirname(__FILE__),'strut/model/action.rb')
require File.join(File.dirname(__FILE__),'strut/controller.rb')

module Strut
  VERSION = '0.0.1'
  ACTIONS = [:index,:show,:new,:edit,:create,:update,:destroy]
  def ACTIONS.to_hash options={}
    actions = self.clone
    actions.reject!{|a| !options[:only].include? a}  if options[:only]
    actions.reject!{|a| options[:except].include? a} if options[:except]

    # hashでの渡し
    self.each{|a| options[a]||=[]}
    actions_hash = {index: options[:index],
                    show: options[:show],
                    new: options[:new],
                    edit: options[:edit],
                    create: options[:create],
                    update: options[:update],
                    destroy: options[:destroy]}
    self.each do |method|
      actions_hash[method] += (actions.include?(method) ? [method] : [])
    end
    return actions_hash
  end
end

