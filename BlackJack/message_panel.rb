class MessagePanel
  def game_starting
    p 'Game starting'
  end

  def dashboard(player, dealer, game)
    dealer_cards = dealer.hand.cards.count.times.map { '*' }
    p "| Casino bank: #{game.bank}"
    p "| Player cards: #{player.hand.cards.join(', ')} | bank: #{player.bank}"
    p "| Dealer cards: #{dealer_cards.join(' ')} | bank: #{dealer.bank}"
  end

  def move_menu
    p '| Your turn:'
    p '| 1. Pass'
    p '| 2. Take card'
    p '| 3. Open cards'
  end

  def ready_to_open_cards; end
end
