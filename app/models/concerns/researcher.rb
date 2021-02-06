module Researcher
  extend ActiveSupport::Concern

  module ClassMethods
    def search(scope, filter_params, order_params)
      all_scope = scope.all
      unless filter_params.blank?
        filter_params.each do |filter, value|
          all_scope = all_scope.send('by_' + filter, value) if value.present?
        end
      end
      unless order_params.blank?
        param, value = order_params.split('-')
        all_scope = all_scope.send('by_order_' + param, value) if value.present?
      end
  
      return all_scope
    end
  end
end