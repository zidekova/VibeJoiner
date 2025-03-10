import 'package:vibejoiner/components/center_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vibejoiner/components/custom_dropdown_menu.dart';
import 'package:vibejoiner/components/custom_text_field.dart';
import 'package:vibejoiner/components/profile_pic.dart';
import 'package:vibejoiner/components/solid_button.dart';
import 'package:vibejoiner/components/wrap_of_chips.dart';
import 'package:vibejoiner/riverpod/auth_provider.dart';
import 'package:vibejoiner/routes/app_router.gr.dart';
import 'package:vibejoiner/screens/main/main_screen.dart';
import 'package:vibejoiner/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistationScreenState();
}

class _RegistationScreenState extends State<RegistrationScreen> {
  TextEditingController usernameController = TextEditingController();
  List<String> selectedGenres = [];
  String? selectedLocation;
  int? selectedRoleIndex;

  final List<String> genres = [
    'Rock',
    'Pop',
    'Hip-Hop',
    'Jazz',
    'Classical',
    'Electronic',
    'Country',
    'Reggae',
    'Metal',
    'Folk',
  ];

  void _onGenreSelected(String genre, bool selected) {
    setState(() {
      if (selected) {
        if (selectedGenres.length < 3) {
          selectedGenres.add(genre);
        }
      } else {
        selectedGenres.remove(genre);
      }
    });
  }

  Future<void> _registerUser() async {
    final user = AuthService().getCurrentUser();
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Užívateľ nie je prihlásený')),
      );
      return;
    }

    final username = usernameController.text.trim();
    final email = user.email;
    final role = selectedRoleIndex == 0 ? 'Hudobník' : 'Klient';
    final location = selectedLocation ?? 'Nezadané';
    final genres = selectedGenres;

    if (username.isEmpty || genres.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vyplňte všetky povinné polia')),
      );
      return;
    }

    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));

    try {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'username': username,
        'email': email,
        'role': role,
        'location': location,
        'genres': genres,
        'createdAt': FieldValue.serverTimestamp(),
      });

      isUserNew = false;

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registrácia úspešná')),
      );

      if (!mounted) return;
      context.pop();
      context.router.replace(const MainRoute());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Chyba pri registrácii: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CenterScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Registrácia'),
      ),
      children: [
        // profile pic
        ProfilePic(
            imageUrl: AuthService().getCurrentUser()?.photoURL ??
                Image.asset('images/profile_pic_icon.png').toString()),

        SizedBox(height: 20),

        // email
        Text(
          'Email: ${AuthService().getCurrentUser()?.email}',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),

        // username text field
        CustomTextField(
            controller: usernameController,
            obscureText: false,
            labelText: 'Zadajte používateľské meno'),

        // toggle switch
        ToggleSwitch(
          activeBgColor: const [Colors.deepPurple, Colors.deepPurple],
          initialLabelIndex: selectedRoleIndex,
          labels: const ['Hudobník', 'Klient'],
          onToggle: (index) {
            setState(() {
              selectedRoleIndex = index;
            });
          },
          minWidth: 150,
        ),

        SizedBox(height: 30),

        // lokalita
        CustomDropdownMenu(
          items: [
            DropdownMenuEntry(value: 'BB', label: 'Banskobystrický kraj'),
            DropdownMenuEntry(value: 'BA', label: 'Bratislavský kraj'),
            DropdownMenuEntry(value: 'KE', label: 'Košický kraj'),
            DropdownMenuEntry(value: 'NR', label: 'Nitriansky kraj'),
            DropdownMenuEntry(value: 'PO', label: 'Prešovský kraj'),
            DropdownMenuEntry(value: 'TN', label: 'Trenčiansky kraj'),
            DropdownMenuEntry(value: 'TT', label: 'Trnavský kraj'),
            DropdownMenuEntry(value: 'ZA', label: 'Žilinský kraj'),
          ],
          label: 'Zadajte lokalitu',
          onSelected: (value) {
            setState(() {
              selectedLocation = value;
            });
          },
        ),

        SizedBox(height: 20),

        // zanre
        const Text(
          'Vyberte tri obľúbené žánre:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        WrapOfChips(
          chips: genres,
          selectedGenres: selectedGenres,
          onSelected: _onGenreSelected,
        ),

        SizedBox(height: 20),

        // button registracia
        SolidButton(
            text: 'ZAREGISTRUJ SA',
            onPressed: () {
              _registerUser();
            }),

        SizedBox(height: 20),
      ],
    );
  }
}
