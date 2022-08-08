class DashboardItem {
//this is to declare the variables
  final String title;

  final String image;

//class constructor
  const DashboardItem({required this.title, required this.image});
}

class DashItems {
  //put all onboarding data model in a list
  static List<DashboardItem> loadItems() {
    //this is an object of all the items
    const obj = <DashboardItem>[
       DashboardItem(
         title: "Purchase your energy from a stable means of exchange",
          image: "assets/images/images/solar.jpg"),
      DashboardItem(
          title: "Analytic monitor of all your power usage from the grid",
          image: "assets/images/images/renew.png"),
     
      DashboardItem(
           title: "We provide fast remittances through our wallet system",
          image: "assets/images/images/science.png"),
       DashboardItem(
           title: "With zero carbon footprints see how green energy solutions with blockchain is digitizing the world",
          image: "assets/images/images/gree.png"),
       
     
    ];
    return obj;
  }
}
