require 'spec_helper'

describe Strut::ACTIONS do
  it{Strut::ACTIONS.should==[:index,:show,:new,:edit,:create,:update,:destroy]}
  it{Strut::ACTIONS.to_hash.should=={index: [:index], show: [:show], new: [:new], edit: [:edit], create: [:create], update: [:update], destroy: [:destroy]}}
  it{Strut::ACTIONS.to_hash(:only=>[:index,:show]).should=={index: [:index], show: [:show], new: [], edit: [], create: [], update: [], destroy: []}}
  it{Strut::ACTIONS.to_hash(:except=>[:new,:edit,:create,:update,:destroy]).should=={index: [:index], show: [:show], new: [], edit: [], create: [], update: [], destroy: []}}
  it{Strut::ACTIONS.to_hash(:index=>[:index2]).should=={index: [:index2,:index], show: [:show], new: [:new], edit: [:edit], create: [:create], update: [:update], destroy: [:destroy]}}
  it{Strut::ACTIONS.to_hash(:show=>[:show2]).should=={index: [:index], show: [:show2,:show], new: [:new], edit: [:edit], create: [:create], update: [:update], destroy: [:destroy]}}
end
