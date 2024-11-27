class Round < ApplicationRecord
  belongs_to :player
  # Description:
  # The Round model describes the format of the data needed to represent
  # a round of axe throwing scores that the user can submit. It is my intent
  # to allow users to only submit rounds that have all scores input to them,
  # based on an appropariate UI. I believe that this will be easier to
  # implment if I only allow submission of complete rounds, and rely on JS
  # (specifically P5.js) to handle reading the rather complicated input.
  # The first link below is a highly useful explanation of how to use JS
  # to make HTML form submissions. The second link is the formal explanation
  # of the IATF rules on scoring axe-throwing.
  #
  # https://developer.mozilla.org/en-US/docs/Learn/Forms/Sending_forms_through_JavaScript
  # https://internationalaxethrowingfederation.com/iatf-rulebook-glossary/

  # In short, the first four columns of the Round record are the same, each
  # takes the form of being a score of 1, 3, 5, or a Drop.
  # The final Called Clutch, throw can take the same form as the first, or
  # can be have the form of 7, of a Drop. Which list of valid options the
  # Called Clutch shot takes is based on whether the player calls clutch
  # before throwing and inputs yes on the appropriate part of the JS [NYI].
  # This called clutch flag of course must be true or false.

  VALID_NORMAL_THROWS = ["1", "3", "5", "Drop"]
  VALID_CLUTCH_THROWS = ["7", "Drop"]

  # TO BE REMOVED LATER
  ALL_VALID_THROWS = ["1", "3", "5", "7", "Drop"]
  BOOLEAN_STRINGS = ["Stay Down", "Call Clutch"]

  validates :player_id, presence: true
  validates :score_1, presence: true
  validates :score_2, presence: true
  validates :score_3, presence: true
  validates :score_4, presence: true
  validates :called_clutch, presence: true
  validates :score_5, presence: true

  validates :score_1, inclusion: {in: VALID_NORMAL_THROWS, message: "%{value} is not a valid score."}
  validates :score_2, inclusion: {in: VALID_NORMAL_THROWS, message: "%{value} is not a valid score."}
  validates :score_3, inclusion: {in: VALID_NORMAL_THROWS, message: "%{value} is not a valid score."}
  validates :score_4, inclusion: {in: VALID_NORMAL_THROWS, message: "%{value} is not a valid score."}
  validates :called_clutch, inclusion: {in: BOOLEAN_STRINGS, message: "%{value} is not a clutch call value."}

  # Unsure if this validation will operate correctly, it seems like it should.
  # Though logically only having one does potentially allow invalid values when the clutch is called atm.
  # I also don't know if white space is a problem.
  # https://guides.rubyonrails.org/v8.0/active_record_validations.html#using-a-symbol-with-if-and-unless
  validates :score_5, 
      inclusion: 
      {in: VALID_NORMAL_THROWS, message: "%{value} is not a valid clutch score."},
          if: :select_clutch?



  def select_clutch?
      called_clutch == BOOLEAN_STRINGS[0]
  end

  def select_down?
      called_clutch == BOOLEAN_STRINGS[1]
  end

end
# temporary