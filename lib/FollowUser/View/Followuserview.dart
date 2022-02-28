import 'package:flutter/material.dart';
import 'package:spyveb/FollowUser/Controller/FollowController.dart';
import 'package:spyveb/Style/AppColor.dart';
import 'package:spyveb/Style/AppString.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class Followuserview extends StatefulWidget {
  const Followuserview({Key? key}) : super(key: key);

  @override
  _FollowuserviewState createState() => _FollowuserviewState();
}

class _FollowuserviewState extends State<Followuserview> {
  final Followcontroller controller = Get.put(Followcontroller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getAPIDATA();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: Obx(
        () => Container(
          height: 60,
          color: orange1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Text(
                    laterBottom,
                    style: TextStyle(
                        fontSize: 18,
                        color: orange2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    const Text(followBottom + " ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    Text(
                      controller.totalFollow.value.toString(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.only(right: 45),
                    child: Text(nextBottom,
                        style: TextStyle(
                            fontSize: 18,
                            color: green,
                            fontWeight: FontWeight.bold)))
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Icon(Icons.arrow_back, size: 25, color: orange),
          title: const Text(
            followTitle,
            style: TextStyle(
                fontSize: 22, color: black, fontWeight: FontWeight.w600),
          )),
      body: Obx(
        () => Container(
          width: size.width,
          color: white,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height * 0.025),
                            const Text(
                              step,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: grey),
                            ),
                            SizedBox(height: size.height * 0.025),
                            const Text(
                              followUsers,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: black),
                            ),
                            SizedBox(height: size.height * 0.04),
                            SizedBox(
                              height: size.height * 0.677,
                              child: controller.followModel.value.results ==
                                      null
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  orange2)))
                                  : ListView.separated(
                                      itemCount: controller
                                          .followModel.value.results!.length,
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        var data = controller
                                            .followModel.value.results;
                                        var dateRelease = dateFormateShow(
                                            controller.followModel.value
                                                .results![i].releaseDate
                                                .toString());

                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  data![i].artworkUrl60 == null
                                                      ? Container(
                                                          width: 75.0,
                                                          height: 75.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: grey),
                                                            shape:
                                                                BoxShape.circle,
                                                            image: const DecorationImage(
                                                                image: AssetImage(
                                                                    "asset/images/empty.png"),
                                                                fit: BoxFit
                                                                    .fill),
                                                          ),
                                                        )
                                                      : CachedNetworkImage(
                                                          width: 75,
                                                          height: 75,
                                                          fit: BoxFit.fill,
                                                          imageUrl: data[i]
                                                              .artworkUrl60
                                                              .toString(),
                                                          placeholder:
                                                              (context, url) =>
                                                                  Container(
                                                            width: 60.0,
                                                            height: 60.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "asset/images/empty.png"),
                                                                  fit: BoxFit
                                                                      .cover),
                                                            ),
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Container(
                                                            width: 75.0,
                                                            height: 75.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/images/empty.png"),
                                                                  fit: BoxFit
                                                                      .cover),
                                                            ),
                                                          ),
                                                          imageBuilder: (context,
                                                                  imageProvider) =>
                                                              Container(
                                                            width: 75.0,
                                                            height: 75.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              image: DecorationImage(
                                                                  image:
                                                                      imageProvider,
                                                                  fit: BoxFit
                                                                      .cover),
                                                            ),
                                                          ),
                                                        ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 16),
                                                    child: SizedBox(
                                                      height: 70,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: size.width *
                                                                0.35,
                                                            child: Text(
                                                              data[i]
                                                                  .artistName
                                                                  .toString(),
                                                              softWrap: true,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800),
                                                            ),
                                                          ),
                                                          Row(children: [
                                                            const Text(
                                                              pricelbl + " ",
                                                              softWrap: true,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                            //
                                                            Text(
                                                              data[i].collectionPrice ==
                                                                      null
                                                                  ? "₹0"
                                                                  : "₹" +
                                                                      data[i]
                                                                          .collectionPrice
                                                                          .toString(),
                                                              softWrap: true,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: const TextStyle(
                                                                  fontSize: 12,
                                                                  color:
                                                                      orange2,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ]),
                                                          Row(children: [
                                                            const Text(
                                                              releseDatelbl +
                                                                  " ",
                                                              softWrap: true,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                            Text(
                                                              dateRelease
                                                                  .toString(),
                                                              softWrap: true,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: const TextStyle(
                                                                  fontSize: 12,
                                                                  color:
                                                                      orange2,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                            data[i].follow == true
                                                ? InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        data[i].follow = false;
                                                      });
                                                      controller
                                                          .totalFollowCheck();
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      width: size.width * 0.25,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: green),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          "FOLLOW",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: green),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        data[i].follow = true;
                                                      });
                                                      controller
                                                          .totalFollowCheck();
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      width: size.width * 0.25,
                                                      decoration: BoxDecoration(
                                                        color: green,
                                                        border: Border.all(
                                                            color: white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          "UNFOLLOW",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: white),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                          ],
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int i) {
                                        return Container(
                                          height: 50,
                                        );
                                      }),
                            ),
                          ]),
                    ),
                  ),
                ),
                // Container(
                //   height: size.height * 0.06,
                //   color: orange1,
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 14),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         const Padding(
                //           padding: EdgeInsets.only(left: 45),
                //           child: Text(
                //             "LATER",
                //             style: TextStyle(
                //                 fontSize: 18,
                //                 color: orange2,
                //                 fontWeight: FontWeight.bold),
                //           ),
                //         ),
                //         Row(
                //           children: [
                //             const Text("Follow  ",
                //                 style: TextStyle(
                //                     fontSize: 18, fontWeight: FontWeight.w600)),
                //             Text(
                //               controller.totalFollow.value.toString(),
                //               style: const TextStyle(
                //                   fontSize: 18, fontWeight: FontWeight.w600),
                //             )
                //           ],
                //         ),
                //         const Padding(
                //             padding: EdgeInsets.only(right: 45),
                //             child: Text("NEXT",
                //                 style: TextStyle(
                //                     fontSize: 18,
                //                     color: green,
                //                     fontWeight: FontWeight.bold)))
                //       ],
                //     ),
                //   ),
                // ),
              ]),
        ),
      ),
    );
  }

  String dateFormateShow(String date) {
    if (date != "null") {
      var inputDate = DateTime.parse(date);
      DateTime parseDate = DateTime.parse(date);
      var outputFormat = DateFormat('dd/MM/yyyy');
      var outputDate = outputFormat.format(inputDate);
      return outputDate;
    } else {
      return "";
    }
  }
}
