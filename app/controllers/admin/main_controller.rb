class Admin::MainController < Admin::AdminController
layout 'admin'
before_filter :authenticate_user!
def index
end

end
