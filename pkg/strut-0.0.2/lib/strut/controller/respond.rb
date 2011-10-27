module Strut
  module Controller
    module Respond
      def respond_index(objs=[],options={})
        options[:t]      ||= Proc.new{}
        options[:t_html] ||= Proc.new{}
        options[:t_xml]  ||= Proc.new{render xml:  objs}
        options[:t_json] ||= Proc.new{render json: objs}
        options[:t_js]   ||= Proc.new{}
        options[:t].call
        respond_to do |format|
          format.html &options[:t_html]
          format.xml  &options[:t_xml]
          format.json &options[:t_json]
          format.js   &options[:t_js]
        end
      end

      def respond_show(obj=nil,options={})
        options[:t]      ||= Proc.new{}
        options[:t_html] ||= Proc.new{}
        options[:t_xml]  ||= Proc.new{render xml:  obj}
        options[:t_json] ||= Proc.new{render json: obj}
        options[:t_js]   ||= Proc.new{}
        options[:t].call
        respond_to do |format|
          format.html &options[:t_html]
          format.xml  &options[:t_xml]
          format.json &options[:t_json]
          format.js   &options[:t_js]
        end
      end

      def respond_create(obj=nil,options={})
        options[:t]      ||= Proc.new{}
        options[:t_html] ||= Proc.new{ redirect_to action: show}
        options[:t_xml]  ||= Proc.new{ render xml:  obj, status: :created, location: obj }
        options[:t_json] ||= Proc.new{ render json: obj, status: :created, location: obj }
        options[:t_js]   ||= Proc.new{}
        options[:f]      ||= Proc.new{}
        options[:f_html] ||= Proc.new{render action: new}
        options[:f_xml]  ||= Proc.new{ render xml:  obj.errors, status: :unprocessable_entity }
        options[:f_json] ||= Proc.new{ render json: obj.errors, status: :unprocessable_entity }
        options[:f_js]   ||= Proc.new{}
        respond_to do |format|
          if obj.save
            flash[:notice] = options[:t_message]
            options[:t].call
            format.html &options[:t_html]
            format.xml  &options[:t_xml]
            format.json &options[:t_json]
            format.js   &options[:t_js]
          else
            flash.now[:error] = options[:f_message] if options[:f_message]
            options[:f].call
            format.html &options[:f_html]
            format.xml  &options[:f_xml]
            format.json &options[:f_json]
            format.js   &options[:f_js]
          end
        end
      end

      def respond_update(obj=nil,options={})
        options[:t]      ||= Proc.new{}
        options[:t_html] ||= Proc.new{ redirect_to action: show}
        options[:t_xml]  ||= Proc.new{ render xml: obj }
        options[:t_json] ||= Proc.new{ render json: obj }
        options[:t_js]   ||= Proc.new{}
        options[:f]      ||= Proc.new{}
        options[:f_html] ||= Proc.new{ render action: edit }
        options[:f_xml]  ||= Proc.new{ render xml:  obj.errors, status: :unprocessable_entity }
        options[:f_json] ||= Proc.new{ render json: obj.errors, status: :unprocessable_entity }
        options[:f_js]   ||= Proc.new{}
        respond_to do |format|
          if obj.update_attributes(params[obj.class.to_s.underscore.gsub("/","_").to_sym])
            flash[:notice] = options[:t_message]
            options[:t].call
            format.html &options[:t_html]
            format.xml  &options[:t_xml]
            format.json &options[:t_json]
            format.js   &options[:t_js]
          else
            flash.now[:error] = options[:f_message] if options[:f_message]
            options[:f].call
            format.html &options[:f_html]
            format.xml  &options[:f_xml]
            format.json &options[:f_json]
            format.js   &options[:f_js]
          end
        end
      end

      def respond_destroy(obj=nil,options={})
        options[:t]      ||= Proc.new{}
        options[:t_html] ||= Proc.new{ redirect_to action: index}
        options[:t_xml]  ||= Proc.new{ render xml: obj }
        options[:t_json] ||= Proc.new{ render json: obj }
        options[:t_js]   ||= Proc.new{}
        options[:f]      ||= Proc.new{}
        options[:f_html] ||= Proc.new{ render action: edit }
        options[:f_xml]  ||= Proc.new{ head :unprocessable_entity }
        options[:f_json] ||= Proc.new{ head :unprocessable_entity }
        options[:f_js]   ||= Proc.new{}
        respond_to do |format|
          if obj.destroy
            flash[:notice] = options[:t_message]
            options[:t].call
            format.html &options[:t_html]
            format.xml  &options[:t_xml]
            format.json &options[:t_json]
            format.js   &options[:t_js]
          else
            flash.now[:error] = options[:f_message]
            options[:f].call
            format.html &options[:f_html]
            format.xml  &options[:f_xml]
            format.json &options[:f_json]
            format.js   &options[:f_js]
          end
        end
      end
    end
  end
end
