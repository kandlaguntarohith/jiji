import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiji/constants/endpoints.dart';
import 'package:jiji/models/categories_list.dart';
import 'package:jiji/models/my_product.dart';
import 'package:jiji/models/subcategories_list.dart';
import 'package:jiji/models/user_model.dart';
import 'package:jiji/models/user_posts.dart';
import 'package:jiji/utilities/size_config.dart';
import 'package:jiji/utilities/theme_data.dart';
import 'package:jiji/widgets/custom_dropdrown.dart';
import 'package:jiji/widgets/custom_textfield.dart';
import 'package:jiji/widgets/item_images.dart';
import 'package:jiji/widgets/jiji_app_bar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

Future<File> urlToFile(String imageUrl) async {
// generate random number.
  var rng = new Random();
// get temporary directory of device.
  Directory tempDir = await getTemporaryDirectory();
// get temporary path from temporary directory.
  String tempPath = tempDir.path;
// create a new file in temporary path with random file name.
  File file = new File('$tempPath' + (rng.nextInt(100)).toString() + '.png');
// call http.get method and pass imageUrl into it to get response.
  http.Response response = await http.get(imageUrl);
// write bodyBytes received in response to file.
  await file.writeAsBytes(response.bodyBytes);
// now return the file which is created with random name in
// temporary directory and image bytes from response is written to // that file.
  return file;
}

class EditProductScreen extends StatefulWidget {
  static String routeName = '/EditProductScreen';
  final MyProduct product;

  const EditProductScreen({Key key, this.product}) : super(key: key);
  @override
  _EditProductScreenState createState() => _EditProductScreenState(product);
}

class _EditProductScreenState extends State<EditProductScreen> {
  List<String> _states = [];
  List<String> _cities = [];
  List<String> _categories = [];
  List<String> _subCategories = [];
  List<File> images = [];
  final _form = GlobalKey<FormState>();
  String title;
  String price;
  String description;
  String state;
  String city;
  String category;
  String subCategory;

  bool _isLoading = false;

  List<String> productUrlImages = [];


  final MyProduct _product;
  final picker = ImagePicker();
  double textSize;

  _EditProductScreenState(this._product);
  @override
  void initState() {
    _states.add("Maharashtra");
    _states.add("UP");
    _states.add("Kerela");
    _states.add("Delhi");
    _states.add("Goa");
    _cities.add("Pune");
    _cities.add("Mumbai");
    _cities.add("Banglore");

    if (_product != null) {
      title = _product.title;
      price = _product.price;
      description = _product.description;
      city = _product.city;
      // state = _product.;
      category = _product.category;
      subCategory = _product.subCategory;
      _product.photo.forEach((element) {
        productUrlImages.add(
            "https://olx-app-jiji.herokuapp.com/api/post/photo/${_product.id}?photoId=${element.id}");
      });
    }
    _product.photo.forEach((element) async {
      images.add(await urlToFile(
          "https://olx-app-jiji.herokuapp.com/api/post/photo/${_product.id}?photoId=${element.id}"));
      setState(() {});
    });
    if (!_cities.contains(_product.city)) _cities.add(_product.city);

    print(_subCategories.length);
    super.initState();
  }

  // _asyncMethod() async {
  //   setState(() {});
  // }

  Future<void> addImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      if (pickedFile != null) {
        images.insert(0, File(pickedFile.path));
      }
    });
  }

  Future<void> _saveForm(UserModel user) async {
    bool valid = _form.currentState.validate();
    if (valid) {
      _form.currentState.save();

      print(title);
      print(price.toString());
      print(description);
      print(city + ", " + state);
      print(category + " " + subCategory);
      


      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer ${user.token}"
      };
      String subCategoryId;
      String categoryId;
      Provider.of<Categories>(context, listen: false)
          .categoriesList
          .forEach((element) {
        if (element.name == category) {
          categoryId = element.id;
        }
      });
      Provider.of<SubCategories>(context, listen: false)
          .subCategoriesList
          .forEach((element) {
        if (element.name == subCategory) {
          subCategoryId = element.id;
        }
      });

      var uriForm =
          Uri.parse(Endpoints.updatePost + "/${_product.id}/${user.uid}");

      var newRequest = new http.MultipartRequest("PUT", uriForm);

      newRequest.fields['name'] = user.name;
      newRequest.fields['description'] = description;
      newRequest.fields['price'] = price.toString();
      newRequest.fields['postedBy'] = user.uid;
      newRequest.fields['title'] = title;
      newRequest.fields['condition'] = "good";
      newRequest.fields['city'] = city;
      newRequest.fields['state'] = state;
      newRequest.fields['category'] = categoryId;
      newRequest.fields['views'] = '0';
      newRequest.fields['subCategory'] = subCategoryId;
      newRequest.headers.addAll(headers);
      var responseNew = await newRequest.send();

      print(responseNew.statusCode);
      //===========================image===========================
      var uri = Uri.parse(Endpoints.updatePost + "/${_product.id}/${user.uid}");

      var request = new http.MultipartRequest("PUT", uri);

      for (var file in images) {
        String fileName = file.path.split("/").last;
        var stream = new http.ByteStream(Stream.castFrom(file.openRead()));

        var length = await file.length();

        var multipartFileSign =
            new http.MultipartFile('photo', stream, length, filename: fileName);

        request.files.add(multipartFileSign);
      }
      request.headers.addAll(headers);

      var response = await request.send();
      setState(() {
        print("SetState triggered again");
        _isLoading = !_isLoading;
      });

      print(response.statusCode);
      if (responseNew.statusCode == 200 && response.statusCode == 200) {
        await Provider.of<UserPosts>(context, listen: false)
            .initialize(user.uid, user.token);
        await showDialog(
          context: context,
          child: AlertDialog(
            title: Text(
              "Product Successfully Edited !",
              style: TextStyle(
                color: Colors.black,
                fontSize: textSize * 1.2,
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Okay',
                  style: TextStyle(
                    color: MyThemeData.primaryColor,
                    fontSize: textSize,
                  ),
                ),
              )
            ],
          ),
        );
      }
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Form validation failed"),
      ));

    }
  }

  Widget renderhHeading(String heading) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: textSize * 2),
        Text(
          heading,
          style: TextStyle(
            color: MyThemeData.inputPlaceHolder,
            fontSize: textSize,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: textSize),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SubCategories>(context, listen: false)
        .subCategoriesList
        .forEach((element) {
      if (!_subCategories.contains(element.name))
        _subCategories.add(element.name);
      if (element.id == _product.subCategory) subCategory = element.name;
    });
    Provider.of<Categories>(context, listen: false)
        .categoriesList
        .forEach((element) {
      if (!_categories.contains(element.name)) _categories.add(element.name);
      if (element.id == _product.category) category = element.name;
    });
    final Box<UserModel> _user =
        Provider.of<Box<UserModel>>(context, listen: false);
    final UserModel _userModel = _user.values.first;
    SizeConfig().init(context);
    final deviceHorizontalPadding = SizeConfig.deviceWidth * 4;
    final availableWidthSpace =
        (SizeConfig.deviceWidth * 100) - (2 * deviceHorizontalPadding);
    textSize = availableWidthSpace * 0.03;
    return Scaffold(
      appBar: PreferredSize(
        child: JijiAppBar(),
        preferredSize: Size.fromHeight(80.0),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceHorizontalPadding),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              SizedBox(height: SizeConfig.deviceHeight * 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "POST NEW ADD",
                    style: TextStyle(
                      color: MyThemeData.inputPlaceHolder,
                      fontSize: textSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Need Help?",
                    style: TextStyle(
                      color: MyThemeData.primaryColor,
                      fontSize: textSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              renderhHeading("Item Name"),
              CustomTextField(
                value: title,
                onSaved: (value) => setState(() => title = value),
                validator: (value) {
                  if (value.isEmpty) return 'Enter title';
                  return null;
                },
                hintText: 'Item Name',
                textInputType: TextInputType.text,
              ),
              renderhHeading("Item Price"),
              CustomTextField(
                value: price == null ? "" : price.toString(),
                onSaved: (value) => setState(
                  () => price = value,
                ),
                validator: (value) {
                  if (value.isEmpty) return 'Enter price';
                  return null;
                },
                hintText: 'Price',
                textInputType: TextInputType.number,
              ),
              renderhHeading("Item Images"),
              AspectRatio(
                aspectRatio: 3,
                child: ItemImages(
                  images: images,
                  addImageFunction: addImage,
                ),
              ),
              renderhHeading("Location"),
              AspectRatio(
                aspectRatio: 8 / 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDropDownMenu(
                      hintText: "State",
                      items: _states,
                      value: state,
                      updateProductDetails: (String newValue) => setState(
                        () => state = newValue,
                      ),
                    ),
                    CustomDropDownMenu(
                      hintText: "City",
                      items: _cities,
                      value: city,
                      updateProductDetails: (String newValue) =>
                          setState(() => city = newValue),
                    ),
                  ],
                ),
              ),
              renderhHeading("Item Category"),
              AspectRatio(
                aspectRatio: 8 / 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDropDownMenu(
                      value: category,
                      hintText: "Category",
                      items: _categories,
                      updateProductDetails: (String newValue) => setState(
                        () => category = newValue,
                      ),
                    ),
                    CustomDropDownMenu(
                      value: subCategory,
                      hintText: "Sub Category",
                      items: _subCategories,
                      updateProductDetails: (String newValue) => setState(
                        () => subCategory = newValue,
                      ),
                    )
                  ],
                ),
              ),
              renderhHeading("Item Description"),
              CustomTextField(
                value: description,
                onSaved: (value) => setState(
                  () => description = value,
                ),
                validator: (value) {
                  if (value.isEmpty) return 'Enter Description';
                  return null;
                },
                hintText: 'Description',
                textInputType: TextInputType.multiline,
              ),
              SizedBox(height: SizeConfig.deviceHeight * 4),
              AspectRatio(
                aspectRatio: 8,
                child: ButtonTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),


                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : RaisedButton(
                          onPressed: (){
                            setState(() {
                              _isLoading = !_isLoading;
                            });
                            _saveForm(_userModel);
                          },
                          child: Text(
                            "POST AD",
                            style: TextStyle(
                              fontSize: textSize * 1.2,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          color: MyThemeData.primaryColor,
                        ),
                ),
              ),
              SizedBox(height: SizeConfig.deviceHeight),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "or Save as a Draft",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: textSize,
                    color: MyThemeData.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.deviceHeight * 3),
            ],
          ),
        ),
      ),
    );
  }
}
