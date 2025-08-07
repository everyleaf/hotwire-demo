class Emotion < ApplicationRecord
  enum :icon, { love: 0, angry: 1, smile: 2 }

  validates :name, presence: true
  validates :body, presence: true
  validates :icon, presence: true

  # NOTE: broadcasts_to -> (_emotion) { "emotions" }, inserts_by: :prepend でも代用可
  after_create_commit -> { broadcast_prepend_to("emotions") }
  after_destroy_commit -> { broadcast_remove_to("emotions") }

  def like_countup!
    update!(like_count: like_count + 1)
  end
end
