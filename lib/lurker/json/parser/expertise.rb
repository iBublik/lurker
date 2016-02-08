module Lurker
  module Json
    class Parser
      module Expertise
        module_function

        def type_polymorph?(array_or_hash)
          return false unless array_or_hash.is_a?(Hash) || array_or_hash.is_a?(Array)

          array_or_hash.empty?
        end

        def type_defined?(hash)
          return false unless hash.is_a?(Hash)

          hash.key?(Json::TYPE) && valid_type?(hash[Json::TYPE])
        end

        def type_supposed?(hash)
          return false unless hash.is_a?(Hash)

          hash.key?(Json::ANYOF) || hash.key?(Json::ALLOF) || hash.key?(Json::ONEOF) ||
          hash.key?(Json::ITEMS) || hash.key?(Json::PROPERTIES) ||
          hash.key?(Json::REF)
        end

        def valid_type?(type)
          return Json::PRIMITIVES.include?(type) unless type.is_a?(Array)
          !type.empty? && type.all? { |t| Json::PRIMITIVES.include?(t) }
        end
      end
    end
  end
end
