import 'package:flutter/material.dart';
import 'package:kderma_mobileapp/appointments.dart';

class FeaturedServicesSection extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  const FeaturedServicesSection(
      {super.key,
      this.padding =
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)});

  @override
  Widget build(BuildContext context) {
    final cardData = [
      {
        'image': 'assets/hydratingserum.jpg',
        'title': 'Hydrating Skin Therapy',
        'subtitle': 'Restore moisture balance to your skin',
        'description':
            'Our advanced hydrating therapy uses hyaluronic acid and marine extracts to deeply moisturize and rejuvenate dehydrated skin.',
      },
      {
        'image': 'assets/facialtreatment.jpg',
        'title': 'Skin Analysis & Consultation',
        'subtitle': 'Personalized skin assessment',
        'description':
            'Get a comprehensive skin analysis using advanced diagnostic tools to identify your unique skin concerns and receive a personalized treatment plan.',
      },
      {
        'image': 'assets/laserhairremoval.jpg',
        'title': 'Laser Skin Rejuvenation',
        'subtitle': 'Advanced laser treatment',
        'description':
            'Experience our state-of-the-art laser skin rejuvenation to reduce fine lines, wrinkles, and improve skin texture for a youthful glow.',
      },
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Featured Services',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          AllFeaturedServicesPage(cardData: cardData),
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Text('View all', style: TextStyle(color: Colors.pink)),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward, color: Colors.pink, size: 18),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 320,
            child: PageView.builder(
              itemCount: cardData.length,
              controller: PageController(viewportFraction: 0.95),
              itemBuilder: (context, index) {
                final data = cardData[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.pink[100]!),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.07),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Image.asset(
                              data['image']!,
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.45),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['title']!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        shadows: [
                                          Shadow(
                                              blurRadius: 2,
                                              color: Colors.black26)
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      data['subtitle']!,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['description']!,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black87),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.pink,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BookAppointmentPage(
                                                serviceData: data),
                                      ),
                                    );
                                  },
                                  child: const Text('Book Appointment'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AllFeaturedServicesPage extends StatelessWidget {
  final List<Map<String, String>> cardData;
  const AllFeaturedServicesPage({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Featured Services'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cardData.length,
        itemBuilder: (context, index) {
          final data = cardData[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.pink[100]!),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink.withOpacity(0.07),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        data['image']!,
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.45),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['title']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  shadows: [
                                    Shadow(blurRadius: 2, color: Colors.black26)
                                  ],
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                data['subtitle']!,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['description']!,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black87),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    BookAppointmentPage(serviceData: data),
                              ),
                            );
                          },
                          child: const Text('Book Appointment'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SkincareServicesSection extends StatelessWidget {
  const SkincareServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Skincare Services',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Discover our range of premium dermatology treatments and services',
                  style: TextStyle(fontSize: 16, color: Colors.pink),
                ),
                const SizedBox(height: 24),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 24,
                  runSpacing: 24,
                  children: const [
                    _ServiceCard(
                      icon: Icons.calendar_today,
                      title: 'Easy Booking',
                      description: 'Book online 24/7 at your convenience',
                    ),
                    _ServiceCard(
                      icon: Icons.person_outline,
                      title: 'Expert Providers',
                      description:
                          'All services performed by certified dermatologists',
                    ),
                    _ServiceCard(
                      icon: Icons.access_time,
                      title: 'Flexible Scheduling',
                      description:
                          'Early morning and evening appointments available',
                    ),
                    _ServiceCard(
                      icon: Icons.credit_card,
                      title: 'Insurance Accepted',
                      description:
                          'We work with most major insurance providers',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const FeaturedServicesSection(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0)),
          OurServicesSection(),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 400;
    final cardWidth = isMobile ? screenWidth - 48 : 250.0;
    return Container(
      width: cardWidth,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.pink[100]!),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.pink, size: 32),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ],
      ),
    );
  }
}

class BookAppointmentPage extends StatefulWidget {
  final Map<String, dynamic> serviceData;
  const BookAppointmentPage({super.key, required this.serviceData});

  @override
  State<BookAppointmentPage> createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, String>> _aestheticians = [
    {'name': 'Daniel De Asis', 'avatar': 'assets/staff1.jpg'},
    {'name': 'Ace Sinag', 'avatar': 'assets/staff2.jpg'},
    {'name': 'George Adiz', 'avatar': 'assets/staff2.jpg'},
    {'name': 'Maria Dela Cruz', 'avatar': ''},
    {'name': 'Jenny Santos', 'avatar': ''},
    {'name': 'Carla Mendoza', 'avatar': ''},
  ];
  String? selectedAesthetician;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void submitForm() {
    if (_formKey.currentState!.validate() &&
        selectedDate != null &&
        selectedTime != null) {
      // Add appointment to store
      final DateTime appointmentDateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );
      final appointment = Appointment(
        clientName: 'Client', // Replace with actual client name if available
        service: widget.serviceData['title'] ?? 'Service',
        dateTime: appointmentDateTime,
        durationMinutes:
            int.tryParse(widget.serviceData['duration']?.toString() ?? '') ??
                30,
        status: 'Pending',
        staffName: selectedAesthetician,
      );
      AppointmentStore().add(appointment);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Appointment Booked'),
          content: const Text('Your appointment has been booked successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Go back to previous screen
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.serviceData['image'] != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.serviceData['image']!,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 24),
              Text(
                widget.serviceData['title'] ?? '',
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              // Persuasive subtitle
              const Text(
                "Limited slots available – book your glow-up today!",
                style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star_half, color: Colors.amber, size: 20),
                  SizedBox(width: 8),
                  Text('4.9',
                      style: TextStyle(color: Colors.black54, fontSize: 15)),
                ],
              ),
              const SizedBox(height: 18),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.07),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DropdownButtonFormField<String>(
                          value: selectedAesthetician,
                          decoration: const InputDecoration(
                            labelText: 'Aesthetician',
                            border: OutlineInputBorder(),
                          ),
                          items: _aestheticians.map((staff) {
                            return DropdownMenuItem<String>(
                              value: staff['name'],
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: staff['avatar']!.isNotEmpty
                                        ? AssetImage(staff['avatar']!)
                                        : null,
                                    child: staff['avatar']!.isEmpty
                                        ? Text(staff['name']![0])
                                        : null,
                                    radius: 14,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(staff['name']!),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedAesthetician = value;
                            });
                          },
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please select an aesthetician'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: pickDate,
                                child: Text(selectedDate == null
                                    ? 'Select Date'
                                    : '${selectedDate!.year}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: pickTime,
                                child: Text(selectedTime == null
                                    ? 'Select Time'
                                    : selectedTime!.format(context)),
                              ),
                            ),
                          ],
                        ),
                        if (selectedDate == null || selectedTime == null)
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Please select date and time',
                                style: TextStyle(color: Colors.red)),
                          ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            onPressed: submitForm,
                            child: const Text('Book Now'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceDetailsPage extends StatelessWidget {
  final Map<String, dynamic> serviceData;
  const ServiceDetailsPage({super.key, required this.serviceData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceData['title'] ?? 'Service Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (serviceData['image'] != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    serviceData['image'],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    serviceData['title'] ?? '',
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  if (serviceData['popular'] == true)
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Popular',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                serviceData['category'] ?? '',
                style: const TextStyle(fontSize: 18, color: Colors.pink),
              ),
              const SizedBox(height: 18),
              Text(
                serviceData['description'] ?? '',
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.access_time, size: 20, color: Colors.pink),
                  const SizedBox(width: 6),
                  Text('${serviceData['duration']} min',
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 18),
                  Text('₱${serviceData['price'].toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 12),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 2),
                      Text('4.9',
                          style:
                              TextStyle(color: Colors.black54, fontSize: 15)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            BookAppointmentPage(serviceData: serviceData),
                      ),
                    );
                  },
                  child: const Text('Book Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OurServicesSection extends StatefulWidget {
  const OurServicesSection({super.key});

  @override
  State<OurServicesSection> createState() => _OurServicesSectionState();
}

class _OurServicesSectionState extends State<OurServicesSection> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, dynamic>> _services = [
    {
      'image': 'assets/facialtreatment.jpg',
      'title': 'Deep Cleansing Facial',
      'category': 'Facials',
      'description':
          'A thorough cleansing treatment that removes impurities, unclogs pores and refreshes your skin. Includes steam,...',
      'duration': 60,
      'price': 85.00,
      'popular': true,
      'available': true,
    },
    {
      'image': 'assets/acnetherapy.jpg',
      'title': 'Anti-Aging Consultation',
      'category': 'Consultation',
      'description':
          'Personalized anti-aging consultation with our dermatologist to create a tailored skincare regimen for your unique needs.',
      'duration': 45,
      'price': 120.00,
      'popular': false,
      'available': true,
    },
    {
      'image': 'assets/acnespot.jpg',
      'title': 'Acne Treatment',
      'category': 'Treatments',
      'description':
          'Specialized treatment for acne-prone skin, focusing on deep cleansing, inflammation reduction, and preventing future...',
      'duration': 75,
      'price': 95.00,
      'popular': false,
      'available': true,
    },
    // New service 1
    {
      'image': 'assets/microdermabrasion.jpg',
      'title': 'Hydrating Skin Therapy',
      'category': 'Therapy',
      'description':
          'Intense moisture treatment designed to restore hydration to dry, dehydrated skin using advanced hyaluronic acid...',
      'duration': 60,
      'price': 110.00,
      'popular': true,
      'available': true,
    },
    // New service 2 (unavailable)
    {
      'image': 'assets/laserhairremoval.jpg',
      'title': 'LED Light Therapy',
      'category': 'Therapy',
      'description':
          'Non-invasive treatment using different wavelengths of light to target various skin concerns from anti-aging to acne.',
      'duration': 30,
      'price': 65.00,
      'popular': false,
      'available': false,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredServices = _services.where((service) {
      final query = _searchQuery.toLowerCase();
      return service['title'].toLowerCase().contains(query) ||
          service['category'].toLowerCase().contains(query);
    }).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          const Text(
            'Our Services',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search services...',
              prefixIcon: const Icon(Icons.search, color: Colors.pink),
              filled: true,
              fillColor: Colors.pink[50],
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 420,
            child: PageView.builder(
              itemCount: filteredServices.length,
              controller: PageController(viewportFraction: 0.95),
              itemBuilder: (context, index) {
                final service = filteredServices[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.pink[100]!),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.07),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Image.asset(
                              service['image'],
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            if (service['popular'])
                              Positioned(
                                top: 12,
                                left: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Text(
                                    'Popular',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            if (service['available'] == false)
                              Positioned.fill(
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Text(
                                      'Currently Unavailable',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    service['title'],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    service['category'],
                                    style: const TextStyle(
                                        fontSize: 13, color: Colors.pink),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                service['description'],
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black87),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  const Icon(Icons.access_time,
                                      size: 18, color: Colors.pink),
                                  const SizedBox(width: 6),
                                  Text('${service['duration']} min',
                                      style: const TextStyle(fontSize: 14)),
                                  const SizedBox(width: 18),
                                  Text(
                                      '₱${service['price'].toStringAsFixed(2)}',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.amber, size: 18),
                                      SizedBox(width: 2),
                                      Text('4.9',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.pink,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    elevation: 0,
                                  ),
                                  onPressed: service['available'] == false
                                      ? null
                                      : () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BookAppointmentPage(
                                                      serviceData: service),
                                            ),
                                          );
                                        },
                                  child: const Text('Book Now'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
