class Game
  attr_reader :menu, :player, :deck, :dealer, :message_panel, :bank

  def initialize(options)
    self.menu = options[:menu]
    self.player = options[:player]
    self.dealer = options[:dealer]
    self.message_panel = options[:message_panel]
    self.bank = 0
  end

  def start
    player.get_name if player.name.nil?
    renew_deck
    message_panel.game_starting
    send_starting_cards
    bet

    loop do
      break if check_for_three_cards
      break if player.ready_to_open?
      move
    end

    finalize
  end

  private

  def renew_deck
    self.deck = Deck.new
  end

  def send_starting_cards
    player.take deck.give_cards(2)
    dealer.take deck.give_cards(2)
  end

  def bet
    player.bank -= 10
    dealer.bank -= 10
    self.bank += 20
  end

  def move
    message_panel.dashboard(player, dealer, self)
    message_panel.move_menu

    player.move self
    message_panel.dashboard(player, dealer, self)

    message_from_dealer = dealer.move self
    p "Dealer is #{message_from_dealer}"
    message_panel.dashboard(player, dealer, self)
  end

  def check_for_three_cards
    player.hand.cards.count >= 3 && dealer.hand.cards.count >= 3
  end

  def finalize
    find_winner
    player.ready_to_open = false
    return 'Game finished' if bank == 0
    start
  end

  def find_winner
    player_score = player.hand.sum
    dealer_score = dealer.hand.sum
    if player_score - 21 < dealer_score - 21
      winner = player
    else
      winner = dealer
    end
    winner.bank += bank
    p "WIN: #{winner.name}"
    reset_game
  end

  def reset_game
    self.bank = 0

    player.reset_cards
    dealer.reset_cards
  end

  attr_writer :menu, :player, :deck, :dealer, :message_panel, :bank
end
