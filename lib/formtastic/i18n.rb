# encoding: utf-8

module Formtastic
  # @private
  module I18n

    DEFAULT_SCOPE = [:formtastic].freeze
    DEFAULT_VALUES = ::Formtastic::I18n::DEFAULT_VALUES[key]
    SCOPES = [
        '%{model}.%{nested_model}.%{action}.%{attribute}',
        '%{model}.%{nested_model}.%{attribute}',
        '%{nested_model}.%{action}.%{attribute}',
        '%{nested_model}.%{attribute}',
        '%{model}.%{action}.%{attribute}',
        '%{model}.%{attribute}',
        '%{attribute}'
      ]

    class << self

      def translate(*args)
        key = args.shift.to_sym
        options = args.extract_options!
        options.reverse_merge!(:default => ::Formtastic::I18n::DEFAULT_VALUES[key])
        options[:scope] = [::Formtastic::I18n::DEFAULT_SCOPE, options[:scope]].flatten.compact
        ::I18n.translate(key, *args, **options)
      end

      alias t translate
    end
  end
end
