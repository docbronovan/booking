class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true #scope.where(:id => record.id).exists?
  end

  def create?
    true #user.present?
  end

  def new?
    true #create?
  end

  def update?
    true #user.present? && (record.user == user || user.admin?)
  end

  def edit?
    true #update?
  end

  def destroy?
    true #update?
  end

  def scope
    #Pundit.policy_scope!(user, record.class)
    record.class
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
