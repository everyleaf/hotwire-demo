class Tweet < ApplicationRecord
  validates :name, presence: true
  validates :body, presence: true
  validates :icon, presence: true
  enum :icon, { love: 0, angry: 1, smile: 2 }

  def like_countup!
    update!(like_count: like_count + 1)
  end

  after_create_commit -> { broadcast_prepend_to("tweets") }
  after_destroy_commit -> { broadcast_remove_to("tweets") }
  # NOTE: broadcasts_to -> (_tweet) { "tweets" }, inserts_by: :prepend でも代用可
end
