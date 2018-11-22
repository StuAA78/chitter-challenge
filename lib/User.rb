class User

  attr_reader :user_id, :handle, :display_name, :email, :password

  def initialize(user_id:, handle:, display_name:, email:, password:)
    @user_id = user_id
    @handle = handle
    @display_name = display_name
    @email = email
    @password = password
  end

  def self.create(handle, display_name, email, password)
    DatabaseConnection.query("INSERT INTO users (handle, display_name, email, password) VALUES ('#{handle}', '#{display_name}', '#{email}', '#{password}')")
  end

  def self.retrieve(user_id: nil)
    result = DatabaseConnection.query("SELECT * FROM users WHERE user_id = '#{user_id}'")
    result.map do |user|
      User.new(
        user_id: user['user_id'],
        handle: user['handle'],
        display_name: user['display_name'],
        email: user['email'],
        password: user['password']
      )
    end
  end
end
