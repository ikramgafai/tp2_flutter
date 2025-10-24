import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/// TP – Widgets de base: Profil utilisateur
/// Uses Material 3 APIs compatible with your Flutter version.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Utilisateur',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16),
          labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        // ✅ CardThemeData instead of CardTheme
        cardTheme: const CardThemeData(
          elevation: 1.5,
          margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.teal,
          titleTextStyle: TextStyle(
            color: Colors.teal,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
          iconTheme: IconThemeData(color: Colors.teal),
        ),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Profil Utilisateur')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Photo de profil (asset)
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              const SizedBox(height: 14),

              // Nom & titre
              Text('Ikram Gafai', style: theme.textTheme.headlineSmall),
              const SizedBox(height: 4),
              Text(
                'Développeuse Flutter / Full-Stack',
                style: theme.textTheme.bodyMedium!.copyWith(color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Infos rapides
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _ChipInfo(icon: Icons.location_on, label: 'Marrakech, MA'),
                  SizedBox(width: 8),
                  _ChipInfo(icon: Icons.work_outline, label: 'Freelance'),
                ],
              ),
              const SizedBox(height: 16),

              // Bio
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Passionnée par Flutter, React et la création d'expériences mobiles/web performantes. "
                        "J'aime le design propre, le code lisible et les produits utiles.",
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // Contacts
              const SizedBox(height: 8),
              const _ContactTile(
                icon: Icons.phone, label: 'Téléphone', value: '+212 6 00 00 00 00',
              ),
              const _ContactTile(
                icon: Icons.email, label: 'Email', value: 'ikramgafai@.com',
              ),
              const _ContactTile(
                icon: Icons.link, label: 'Portfolio', value: 'https://ikramgafai.com',
              ),
              const _ContactTile(
                icon: Icons.location_city, label: 'Adresse', value: 'Al Massar, Marrakech',
              ),

              const SizedBox(height: 16),

              // Actions
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.message),
                      label: const Text('Message'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.person_add_alt),
                      label: const Text('Suivre'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChipInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ChipInfo({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.teal.withOpacity(.25)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.teal),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(color: Colors.teal)),
        ],
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _ContactTile({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: ListTile(
        leading: Icon(icon, color: theme.colorScheme.primary),
        title: Text(label, style: theme.textTheme.labelLarge),
        subtitle: Text(value),
        onTap: () {
        },
      ),
    );
  }
}
