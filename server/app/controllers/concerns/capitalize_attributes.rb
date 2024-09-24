module CapitalizeAttributes
  extend ActiveSupport::Concern

  class_methods do
    # Allows specifying the attributes to capitalize for any resource
    def capitalize(*attributes)
      before_action do
        capitalize_attributes(attributes)
      end
    end
  end

  private

  # Dynamically determines the correct resource key and capitalizes the specified attributes
  def capitalize_attributes(attributes)
    # Dynamically determine the resource key from params (usually the name of the controller's resource)
    resource_key = params.keys.find { |key| params[key].is_a?(ActionController::Parameters) }

    return unless resource_key

    # Capitalize the specified attributes for the detected resource
    attributes.each do |attribute|
      if params[resource_key][attribute].present?
        params[resource_key][attribute] = params[resource_key][attribute].capitalize
      end
    end
  end
end
