import 'package:agri/widget/animated_fade_slide.dart';
import 'package:agri/widget/custom_text_field.dart';
import 'package:agri/widget/footer_section.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildSignupForm(String userType) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Sign up as $userType',
            style: const TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          CustomTextField(
            label: "Name...",
            icon: Icons.person,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: "Email...",
            icon: Icons.email,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: "Password",
            icon: Icons.password_outlined,
            isPassword: true,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: "Confirm Password",
            icon: Icons.password,
            isPassword: true,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18),
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Sign Up",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/bg.jpg",
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.91,
                  width: double.infinity,
                  colorBlendMode: BlendMode.clear,
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: AnimatedFadeSlide(
                      duration: const Duration(milliseconds: 700),
                      delay: const Duration(milliseconds: 200),
                      offsetY: 30,
                      child: Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.4),
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 12,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TabBar(
                              controller: _tabController,
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.white,
                              unselectedLabelStyle: TextStyle(
                                fontSize: 12,
                                //fontWeight: FontWeight.bold,
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              indicatorColor: Colors.white,
                              tabs: const [
                                Tab(text: "Buyer"),
                                Tab(text: "Farmer"),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 460,
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  _buildSignupForm("Buyer"),
                                  _buildSignupForm("Farmer"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
