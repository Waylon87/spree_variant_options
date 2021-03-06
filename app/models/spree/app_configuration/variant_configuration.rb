module SpreeVariantOptions
  class VariantConfiguration < Spree::Preferences::Configuration
    preference :allow_select_outofstock, :boolean, :default => false
    preference :default_instock, :boolean, :default => false
    preference :option_value_path, :string, :default => '/spree/option_values/:id/:style/:basename.:extension'
    preference :option_value_url, :string, :default => ':option_value_path'
    preference :option_value_styles, :string, default: "{\"small\":\"30x30#\",\"large\":\"140x110#\"}"
    preference :option_value_default_style, :string, default: 'small'
  end
end
