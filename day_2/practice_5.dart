void main() {
  // Hello.

  BookingSystem bookingSystem = BookingSystem();

  bookingSystem.bookTicket(RegularTicket());
  bookingSystem.bookTicket(VIPTicket());

  bookingSystem.showTickets();
  bookingSystem.totalPrice();
}

enum TicketType { Regular, VIP }

class user {
  String name;
  String email;

  user(this.name, this.email);
}

abstract class Ticket {
  getPrice();
}

class RegularTicket extends Ticket {
  double price = 10.0;

  TicketType ticketType = TicketType.Regular;

  @override
  getPrice() {
    return price;
  }
}

class VIPTicket extends Ticket {
  double price = 20.0;

  TicketType ticketType = TicketType.VIP;

  @override
  getPrice() {
    return price;
  }
}

class BookingSystem {
  List<Ticket> tickets = [];

  void bookTicket(Ticket ticket) {
    tickets.add(ticket);
  }

  void showTickets() {
    for (var ticket in tickets) {
      print('Ticket Price: ${ticket.getPrice()}');
    }
  }

  void totalPrice() {
    double total = 0.0;
    for (var ticket in tickets) {
      total += ticket.getPrice();
    }
    print('Total Price: $total');
  }
}
