class Tag < ActiveRecord::Base
  has_and_belongs_to_many :people

  before_validation :set_random_color

  validates :name, :color, presence: true

  attr_accessor :change_color

  def update(params)
    params[:change_color] = params[:change_color] == '1'
    super(params)
  end

  def color_string
    "%06x" % color
  end

  private

  def set_random_color
    if change_color || id.nil?
      self.color = Array.new(3) { |i| "%02x" % rand(100..250) }.join.to_i(16)
    end
  end

end
