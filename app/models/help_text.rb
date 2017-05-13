class HelpText < ApplicationRecord
  has_many :help_messages

  def message_for(player)
    message = help_messages.find {|m| m.player == player}
    message || HelpMessage.create do |m|
      m.help_text = self
      m.player = player
      m.save
    end
  end
end
