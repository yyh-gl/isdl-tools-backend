# Swagger settings
# baseのcontrollerの指定、変換パスの設定
class Swagger::Docs::Config
  def self.base_api_controller; ActionController::API end
  def self.transform_path(path, api_version); "apidocs/#{path}" end
end

# 出力JSON設定
Swagger::Docs::Config.register_apis(
    { 'v1' => {
        :api_extension_type => nil,
        :api_file_path => 'public/apidocs/', # JSONが置かれるPATH
        :base_path => "http://#{ENV['SERVER_IP']}:#{ENV['SERVER_PORT']}/", # 最後の`/`が置換されてしまうのでURLを記載
        :clean_directory => true,
        :formatting => :pretty,
        :camelize_model_properties => false,
        :controller_base_path => '',
        :attributes => {
            :info => {
                'title'       => 'Spajam API',
                'description' => 'for Spajam and you',
                'contact'     => 'test@example.com',
                'license'     => 'Apache 2.0',
                'licenseUrl'  => 'http://www.apache.org/licenses/LICENSE-2.0.html'
            }
        }
    }})

GrapeSwaggerRails.options.app_name    = "Spajam API"
# 基盤となるJSON
GrapeSwaggerRails.options.url         = "apidocs/api-docs.json/"
# こっちの`/`は置換されないのでこれでOK
GrapeSwaggerRails.options.app_url     = "/"