import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
   LandingPage({super.key});

  final ScrollController _scrollController = ScrollController();
  final GlobalKey _featuresKey = GlobalKey();
  final GlobalKey _howItWorksKey = GlobalKey();
  final GlobalKey _pricingKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                _buildHeader(context, constraints),
                _buildFeatures(constraints),
                _buildPricing(constraints),
                _buildHowItWorks(constraints),
                _buildTestimonials(constraints),
                _buildCTA(constraints),
                _buildContact(constraints),
                _buildFooter(context, constraints),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context, BoxConstraints constraints) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1E1E1E),
            const Color(0xFF2F7AC8).withOpacity(0.8),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/logoz.png', height: 40),
                Row(
                  children: [
                    _buildNavButton('Fonctionnalités', onTap: () => _scrollToKey(_featuresKey)),
                    _buildNavButton('Comment ça marche', onTap: () => _scrollToKey(_howItWorksKey)),
                    _buildNavButton('Tarifs', onTap: () => _scrollToKey(_pricingKey)),
                    _buildNavButton('Contact', onTap: () => _scrollToKey(_contactKey)),
                    const SizedBox(width: 16),
                    _buildDownloadButton(),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.verified,
                                color: Color(0xFF2F7AC8),
                                size: 16,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Service financier agréé',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Votre avance sur salaire\nen quelques clics',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Obtenez jusqu\'à 50% de votre salaire en avance,\nsans paperasse et sans frais cachés.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 20,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            _buildStoreButton(
                              'assets/google-play.png',
                              'Disponible sur\nGoogle Play',
                            ),
                            const SizedBox(width: 16),
                            _buildStoreButton(
                              'assets/app-store.png',
                              'Télécharger sur\nl\'App Store',
                            ),
                          ],
                        ),
                        const SizedBox(height: 48),
                        Row(
                          children: [
                            _buildStat('10K+', 'Utilisateurs\nactifs'),
                            const SizedBox(width: 48),
                            _buildStat('500M+', 'FCFA\ndécaissés'),
                            const SizedBox(width: 48),
                            _buildStat('4.8/5', 'Note\nmoyenne'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (constraints.maxWidth > 1000)
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 400,
                            height: 400,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF2F7AC8).withOpacity(0.1),
                            ),
                          ),
                          Image.asset(
                            'assets/app-preview.png',
                            height: 600,
                          ),
                          Positioned(
                            top: 100,
                            left: 0,
                            child: _buildFeatureHighlight(
                              'Transfert instantané',
                              'Recevez votre argent en quelques minutes',
                              Icons.speed,
                            ),
                          ),
                          Positioned(
                            bottom: 100,
                            right: 0,
                            child: _buildFeatureHighlight(
                              'Sécurité maximale',
                              'Vos données sont cryptées',
                              Icons.security,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatures(BoxConstraints constraints) {
    return Container(
      key: _featuresKey,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 48),
      child: Column(
        children: [
          const Text(
            'Nos Fonctionnalités',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Découvrez tout ce que Zalama peut faire pour vous',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 64),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              _buildFeatureCard(
                icon: Icons.account_balance_wallet,
                title: 'Avance sur Salaire',
                description: 'Obtenez une avance sur votre salaire en quelques clics, sans paperasse.',
              ),
              _buildFeatureCard(
                icon: Icons.speed,
                title: 'Transfert Rapide',
                description: 'Recevez votre argent instantanément sur votre compte mobile money.',
              ),
              _buildFeatureCard(
                icon: Icons.security,
                title: 'Sécurité Maximale',
                description: 'Vos données sont protégées avec les dernières technologies de cryptage.',
              ),
              _buildFeatureCard(
                icon: Icons.support_agent,
                title: 'Support 24/7',
                description: 'Notre équipe est disponible pour vous aider à tout moment.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF242426),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF2F2F2F),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF2F7AC8).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF2F7AC8),
              size: 24,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPricing(BoxConstraints constraints) {
    return Container(
      key: _pricingKey,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 48),
      decoration: const BoxDecoration(
        color: Color(0xFF242426),
      ),
      child: Column(
        children: [
          const Text(
            'Nos Tarifs',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Des solutions adaptées à vos besoins',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 64),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              _buildPricingCard(
                title: 'Avance Standard',
                price: '5%',
                features: [
                  'Jusqu\'à 30% du salaire',
                  'Remboursement sous 30 jours',
                  'Sans frais cachés',
                  'Support par email',
                ],
                isPopular: false,
              ),
              _buildPricingCard(
                title: 'Avance Premium',
                price: '3%',
                features: [
                  'Jusqu\'à 50% du salaire',
                  'Remboursement flexible',
                  'Transfert instantané',
                  'Support prioritaire 24/7',
                ],
                isPopular: true,
              ),
              _buildPricingCard(
                title: 'Avance Business',
                price: 'Sur mesure',
                features: [
                  'Montant personnalisé',
                  'Conditions flexibles',
                  'Service dédié',
                  'Support VIP',
                ],
                isPopular: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPricingCard({
    required String title,
    required String price,
    required List<String> features,
    required bool isPopular,
  }) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isPopular ? const Color(0xFF2F7AC8) : const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isPopular ? Colors.transparent : const Color(0xFF2F2F2F),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          if (isPopular)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Le plus populaire',
                style: TextStyle(
                  color: Color(0xFF2F7AC8),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            price,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          ...features.map((feature) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: isPopular ? Colors.white : const Color(0xFF2F7AC8),
                  size: 20,
                ),
                const SizedBox(width: 12),
                Text(
                  feature,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isPopular ? Colors.white : const Color(0xFF2F7AC8),
                foregroundColor: isPopular ? const Color(0xFF2F7AC8) : Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Commencer',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorks(BoxConstraints constraints) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 48),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF242426),
            Color(0xFF1E1E1E),
          ],
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Comment ça marche ?',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 64),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStep(
                number: '1',
                title: 'Inscrivez-vous',
                description: 'Créez votre compte en quelques minutes',
              ),
              _buildStep(
                number: '2',
                title: 'Connectez votre compte',
                description: 'Liez votre compte bancaire',
              ),
              _buildStep(
                number: '3',
                title: 'Demandez une avance',
                description: 'Recevez votre argent instantanément',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonials(BoxConstraints constraints) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 48),
      child: Column(
        children: [
          const Text(
            'Ce que disent nos utilisateurs',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 64),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            children: [
              _buildTestimonialCard(
                name: 'Marie S.',
                role: 'Enseignante',
                text: 'Zalama m\'a permis de gérer mes imprévus financiers.',
              ),
              _buildTestimonialCard(
                name: 'Jean D.',
                role: 'Commercial',
                text: 'Une application simple et efficace, je recommande !',
              ),
              _buildTestimonialCard(
                name: 'Sophie M.',
                role: 'Infirmière',
                text: 'Le support client est vraiment réactif et professionnel.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCTA(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 48),
      padding: const EdgeInsets.all(64),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2F7AC8),
            Color(0xFF1565C0),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const Text(
            'Prêt à commencer ?',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Téléchargez l\'application et profitez de nos services dès maintenant',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStoreButton(
                'assets/google-play.png',
                'Disponible sur\nGoogle Play',
              ),
              const SizedBox(width: 16),
              _buildStoreButton(
                'assets/app-store.png',
                'Télécharger sur\nl\'App Store',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContact(BoxConstraints constraints) {
    return Container(
      key: _contactKey,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 48),
      decoration: const BoxDecoration(
        color: Color(0xFF242426),
      ),
      child: Column(
        children: [
          const Text(
            'Contactez-nous',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Une question ? N\'hésitez pas à nous contacter',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 64),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (constraints.maxWidth > 900)
                  Expanded(
                    child: _buildContactInfo(),
                  ),
                if (constraints.maxWidth > 900)
                  const SizedBox(width: 64),
                Expanded(
                  flex: 2,
                  child: _buildContactForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context, BoxConstraints constraints) {
    return Container(
      padding: const EdgeInsets.only(top: 80, bottom: 32),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF242426),
            Color(0xFF1E1E1E),
          ],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/logoz.png', height: 40),
                      const SizedBox(height: 24),
                      Text(
                        'Votre partenaire financier de confiance pour une gestion simplifiée de vos finances au quotidien.',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          _buildSocialButton(Icons.facebook, () {}),
                          const SizedBox(width: 16),
                          _buildSocialButton(Icons.telegram, () {}),
                          const SizedBox(width: 16),
                          _buildSocialButton(Icons.telegram, () {}),
                          const SizedBox(width: 16),
                          _buildSocialButton(Icons.telegram, () {}),
                        ],
                      ),
                    ],
                  ),
                ),
                if (constraints.maxWidth > 800) ...[
                  Expanded(
                    child: _buildFooterLinks(
                      context,
                      'Navigation',
                      ['Accueil', 'Fonctionnalités', 'Comment ça marche', 'Tarifs'],
                      [
                        () => _scrollToTop(),
                        () => _scrollToKey(_featuresKey),
                        () => _scrollToKey(_howItWorksKey),
                        () => _scrollToKey(_pricingKey),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _buildFooterLinks(
                      context,
                      'Légal',
                      [
                        'Conditions d\'utilisation',
                        'Politique de confidentialité',
                        'Mentions légales',
                        'CGU'
                      ],
                      [
                        () => _navigateToPage(context, '/terms'),
                        () => _navigateToPage(context, '/privacy'),
                        () => _navigateToPage(context, '/legal'),
                        () => _navigateToPage(context, '/cgu'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _buildFooterLinks(
                      context,
                      'Support',
                      ['FAQ', 'Contact', 'Centre d\'aide', 'Blog'],
                      [
                        () => _navigateToPage(context, '/faq'),
                        () => _scrollToKey(_contactKey),
                        () => _navigateToPage(context, '/help'),
                        () => _navigateToPage(context, '/blog'),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 64),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 32),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xFF2F2F2F),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '© ${DateTime.now().year} Zalama. Tous droits réservés.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(String text, {VoidCallback? onTap}) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildStoreButton(String image, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(image, height: 24),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required String number,
    required String title,
    required String description,
  }) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: const Color(0xFF2F7AC8),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTestimonialCard({
    required String name,
    required String role,
    required String text,
  }) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF242426),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.format_quote,
            color: Color(0xFF2F7AC8),
            size: 32,
          ),
          const SizedBox(height: 16),
          Text(
            text,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFF2F7AC8),
                child: Text(
                  name[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    role,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF2F7AC8).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: Icon(icon, color: const Color(0xFF2F7AC8)),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildFooterLinks(
    BuildContext context,
    String title,
    List<String> links,
    List<VoidCallback> callbacks,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        ...List.generate(
          links.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: callbacks[index],
              child: Text(
                links[index],
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _navigateToPage(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactInfoItem(
          icon: Icons.location_on_outlined,
          title: 'Adresse',
          content: 'Conakry, République de Guinée',
        ),
        const SizedBox(height: 32),
        _buildContactInfoItem(
          icon: Icons.phone_outlined,
          title: 'Téléphone',
          content: '+224 629 99 99 99',
        ),
        const SizedBox(height: 32),
        _buildContactInfoItem(
          icon: Icons.email_outlined,
          title: 'Email',
          content: 'contact@zalama.com',
        ),
        const SizedBox(height: 48),
        const Text(
          'Téléchargez notre application',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Image.asset(
          'assets/qr-code.png',
          width: 150,
          height: 150,
        ),
      ],
    );
  }

  Widget _buildContactInfoItem({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF2F7AC8).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF2F7AC8),
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              content,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactForm() {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();
    String selectedSubject = 'Support technique';

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  controller: nameController,
                  label: 'Nom complet',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre nom';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildTextField(
                  controller: emailController,
                  label: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Veuillez entrer un email valide';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildTextField(
            controller: messageController,
            label: 'Message',
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer votre message';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Traitement du formulaire
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2F7AC8),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Envoyer',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFF64748B)),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFF2F7AC8),
            width: 2,
          ),
        ),
      ),
      validator: validator,
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 14,
            height: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureHighlight(String title, String description, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF242426),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF2F7AC8).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF2F7AC8),
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadButton() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2F7AC8), Color(0xFF45A0E3)],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
        ),
        child: const Text(
          'Télécharger l\'app',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
} 