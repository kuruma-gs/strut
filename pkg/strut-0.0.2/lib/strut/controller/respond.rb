module Strut
  module Controller
    module Respond
      def respond_index(objs=[],options={})
        respond_to do |format|
          format.html &options[:t]
          format.xml  { render :xml  => objs }
          format.json { render :json => objs }
          format.js
        end
      end

      def respond_show(obj=nil,options={})
        respond_to do |format|
          format.html &options[:t]
          format.xml  { render :xml  => obj }
          format.json { render :json => obj }
          format.js
        end
      end

      def respond_create(obj=nil,options={})
        respond_to do |format|
          if obj.save
            flash[:notice] = options[:t_message]
            format.html &options[:t]
            format.xml  { render :xml  => obj, :status => :created, :location => obj }
            format.json { render :json => obj, :status => :created, :location => obj }
            format.js
          else
            flash[:error] = options[:f_message] if options[:f_message]
            format.html &options[:f]
            format.xml  { render :xml  => obj.errors, :status => :unprocessable_entity }
            format.json { render :json => obj.errors, :status => :unprocessable_entity }
            format.js
          end
        end
      end

      def respond_update(obj=nil,options={})
        respond_to do |format|
          if obj.update_attributes(params[obj.class.to_s.underscore.to_sym])
            flash[:notice] = options[:t_message]
            format.html &options[:t]
            format.xml  { head :ok }
            format.json { head :ok }
            format.js
          else
            flash[:error] = options[:f_message] if options[:f_message]
            format.html &options[:f]
            format.xml  { render :xml  => instance_variable_get("@#{file_name}").errors, :status => :unprocessable_entity }
            format.json { render :json => instance_variable_get("@#{file_name}").errors, :status => :unprocessable_entity }
            format.js
          end
        end
      end

      def respond_destroy(obj=nil,options={})
        respond_to do |format|
          if obj.destroy
            flash[:notice] = options[:t_message]
            format.html &options[:t]
            format.xml  { head :ok }
            format.json { head :ok }
            format.js
          else
            flash[:error] = options[:f_message]
            format.html &options[:f]
            format.xml  { head :unprocessable_entity }
            format.json { head :unprocessable_entity }
            format.js
          end
        end
      end
    end
  end
end
