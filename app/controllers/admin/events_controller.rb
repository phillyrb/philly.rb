class Admin::EventsController < AdministrativeController
  # GET /events
  # GET /events.xml
  def index
    @events = Event.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    setup_variables
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    setup_variables
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    setup_variables
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to(admin_event_path(@event)) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  def copy
    setup_variables
    @event = Event.find(params[:id])
    @new_event = Event.create(@event.attributes)

    redirect_to edit_admin_event_path(@new_event)
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    setup_variables
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(admin_event_path(@event)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(admin_events_url) }
      format.xml  { head :ok }
    end
  end
  
  private
    
    def setup_variables
      @locations = Location.find(:all).map {|l| [l.name, l.id]}
      @categories = EventCategory.find(:all).map {|c| [c.name, c.id]}
    end
end
