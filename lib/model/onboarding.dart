class OnboardingItem {
//this is to declare the variables
  final String title;

  final String image;

//class constructor
  const OnboardingItem({required this.title, required this.image});
}

class OboardingItems {
  //put all onboarding data model in a list
  static List<OnboardingItem> loadItems() {
    //this is an object of all the items
    const obj = <OnboardingItem>[
      OnboardingItem(
          title: "Analytic monitor of all your power usage from the grid",
          image: "assets/images/onboarding/item3.png"),
      OnboardingItem(
         title: "Purchase your energy from a stable means of exchange",
          image: "assets/images/onboarding/item2.png"),
      OnboardingItem(
           title: "We provide fast remittances through our wallet system",
          image: "assets/images/onboarding/item1.png"),
       OnboardingItem(
           title: "We are dedicated to protecting your privacy and secure payment",
          image: "assets/images/onboarding/item4.png"),
       OnboardingItem(
           title: "Peer to Peer Payment!",
          image: "assets/images/onboarding/item5.png"),
     
    ];
    return obj;
  }
}
