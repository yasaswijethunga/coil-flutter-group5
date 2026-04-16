import 'package:flutter/material.dart';
import 'team_data.dart';
import 'theme_colors.dart';

class MemberDetailPage extends StatelessWidget {
  final TeamMember member;
  final int index;

  const MemberDetailPage({super.key, required this.member, required this.index});

  List<String> get hobbiesList =>
      member.hobbies.split(',').map((e) => e.trim()).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: kGradientStart,
            foregroundColor: Colors.white,
            leading: Tooltip(
              message: 'Go back',
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [kGradientStart, kGradientEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    Hero(
                      tag: 'member-photo-$index',
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: kAccent, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 15,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 65,
                          backgroundImage: member.imagePath != null
                              ? AssetImage(member.imagePath!)
                              : null,
                          backgroundColor: kLightBg,
                          child: member.imagePath == null
                              ? Icon(Icons.person, size: 65, color: kPrimary)
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      member.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white60),
                      ),
                      child: Text(
                        member.role,
                        style: const TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  _sectionCard(
                    icon: Icons.flag_rounded,
                    title: 'Home Country',
                    child: Text(
                      member.country,
                      style: const TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _sectionCard(
                    icon: Icons.star_rounded,
                    title: 'Hobbies',
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: hobbiesList.map((hobby) {
                        return Chip(
                          label: Text(hobby),
                          backgroundColor: kLightBg,
                          labelStyle: TextStyle(
                            color: kPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                          avatar: Icon(Icons.favorite, size: 14, color: kPrimary),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    elevation: 3,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: kAccent.withOpacity(0.4), width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.format_quote_rounded, color: kPrimary, size: 32),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Personal Motto',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimary,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  '"${member.motto}"',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black87,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: kAccent.withOpacity(0.3), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: kPrimary, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kPrimary,
                  ),
                ),
              ],
            ),
            Divider(height: 16, color: kAccent.withOpacity(0.3)),
            child,
          ],
        ),
      ),
    );
  }
}