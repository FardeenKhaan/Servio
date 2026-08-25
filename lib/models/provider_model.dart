class ProviderModel {
  final String id;
  final String name;
  final String avatar;
  final double rating;
  final String reviewCount;
  final int hourlyRate;
  final List<String> services;
  final String officeAddress;
  final int totalBookings;
  final int servicesOffered;
  final String about;
  final int staffCount;
  final bool isFullyBooked;
  bool isBookmarked;

  ProviderModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.rating,
    required this.reviewCount,
    required this.hourlyRate,
    required this.services,
    this.officeAddress = 'Villa 27, Street 12, Al Barsha 2, Dubai',
    this.totalBookings = 10,
    this.servicesOffered = 3,
    this.about =
        "Hi, I'm Jonathan Davies — a professional home cleaner with over 4 years of experience delivering top-quality cleaning services across Dubai.",
    this.staffCount = 12,
    this.isFullyBooked = false,
    this.isBookmarked = false,
  });
}
