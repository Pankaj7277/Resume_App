import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:res_builder/components/form.dart';
import 'package:res_builder/screens/preview.dart';

class FormPage extends StatefulWidget {
  const FormPage({
    super.key,
  });

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  Map<String, dynamic> model = {};
  final _formKey = GlobalKey<FormState>();
  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return ('Enter a valid email address.');
    } else {
      return null;
    }
  }

  String dropDownValue = 'Select gender';

  var item = ["Male", "Female", "Other"];
  bool isLoading = false;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _hobbies = TextEditingController();

  final TextEditingController _qualification = TextEditingController();

  final TextEditingController _certification = TextEditingController();
  final TextEditingController _achievements = TextEditingController();
  final TextEditingController _experience = TextEditingController();

  final TextEditingController _skills = TextEditingController();
  final TextEditingController _projectDetail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Personal Information',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      ("Name*"),
                    ),
                    const SizedBox(height: 8.0),
                    FormData(
                      width: double.infinity,
                      readOnly: false,
                      lines: 1,
                      controller: _name,
                      label: 'Name',
                      obscureText: false,
                      val: (value) {
                        if (value!.isEmpty || value == null) {
                          return ('Please enter name');
                        }
                        return null;
                      },
                      saved: (value) {
                        _name.text = value;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      ("Email*"),
                    ),
                    const SizedBox(height: 8.0),
                    FormData(
                      width: double.infinity,
                      readOnly: false,
                      controller: _email,
                      label: 'Email',
                      obscureText: false,
                      val: (value) => validateEmail(value),
                      saved: (value) {
                        _email.text = value;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      ("Gender*"),
                    ),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  hoverColor: Colors.transparent,
                                  filled: true,
                                  fillColor: Colors.blueGrey[50],
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(10)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedErrorBorder: InputBorder.none,
                                ),
                                hint: Text(
                                  (dropDownValue.toString()),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .merge(
                                        const TextStyle(
                                          color: Colors.black38,
                                          fontSize: 12,
                                        ),
                                      ),
                                ),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: item.map((String val) {
                                  return DropdownMenuItem(
                                      value: val, child: Text((val)));
                                }).toList(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return ("Please select your gender");
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (String? nValue) {
                                  setState(() {
                                    dropDownValue = nValue!;
                                    _gender.text = dropDownValue;
                                  });
                                }),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      ("Date Of Birth*"),
                    ),
                    const SizedBox(height: 8.0),
                    FormData(
                      width: double.infinity,
                      readOnly: true,
                      label: "dd-mm-yyyy",
                      suffixIcon: IconButton(
                        splashRadius: 22,
                        onPressed: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1970),
                              lastDate: DateTime.now());
                          if (pickeddate != null) {
                            setState(() {
                              _dob.text =
                                  DateFormat("dd-MM-yyyy").format(pickeddate);
                            });
                          }
                        },
                        icon: const Icon(Icons.calendar_month_rounded,
                            color: Colors.black54),
                      ),
                      controller: _dob,
                      obscureText: false,
                      val: (value) {
                        if (value!.isEmpty || value == null) {
                          return ('Please enter your DOB');
                        }
                        return null;
                      },
                      saved: (value) {
                        _dob.text = value;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      ("Phone Number*"),
                    ),
                    const SizedBox(height: 8.0),
                    FormData(
                      width: double.infinity,
                      readOnly: false,
                      lines: 1,
                      controller: _phone,
                      label: 'Phone number',
                      obscureText: false,
                      inputFormatter: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      val: (value) {
                        if (value!.isEmpty || value == null) {
                          return ('Please enter your phone');
                        } else if (value!.length != 10) {
                          return ("Please enter valid phone number");
                        }
                        return null;
                      },
                      saved: (value) {
                        _phone.text = value;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      ("Address*"),
                    ),
                    const SizedBox(height: 8.0),
                    FormData(
                      width: double.infinity,
                      readOnly: false,
                      lines: 1,
                      controller: _address,
                      label: "Address",
                      obscureText: false,
                      val: (value) {
                        if (value!.isEmpty || value == null) {
                          return ('Please enter address');
                        }
                        return null;
                      },
                      saved: (value) {
                        _address.text = value;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      ("Hobbies*"),
                    ),
                    const SizedBox(height: 8.0),
                    FormData(
                      width: double.infinity,
                      readOnly: false,
                      lines: 1,
                      controller: _hobbies,
                      label: "Hobbies",
                      obscureText: false,
                      val: (value) {
                        if (value!.isEmpty || value == null) {
                          return ('Please enter hobbies');
                        }
                        return null;
                      },
                      saved: (value) {
                        _hobbies.text = value;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Educational Qualification",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Highest qualifiaction*'),
                    const SizedBox(
                      height: 8,
                    ),
                    FormData(
                      width: double.infinity,
                      readOnly: false,
                      lines: 1,
                      controller: _qualification,
                      label: "Highest qualification",
                      obscureText: false,
                      val: (value) {
                        if (value!.isEmpty || value == null) {
                          return ('Please enter qualification');
                        }
                        return null;
                      },
                      saved: (value) {
                        _qualification.text = value;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Skills",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Skills*'),
                    const SizedBox(
                      height: 8,
                    ),
                    FormData(
                      width: double.infinity,
                      readOnly: false,
                      lines: 1,
                      controller: _skills,
                      label: "Skills",
                      obscureText: false,
                      val: (value) {
                        if (value!.isEmpty || value == null) {
                          return ('Please enter skills');
                        }
                        return null;
                      },
                      saved: (value) {
                        _skills.text = value;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Experience",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      ("Experience*"),
                    ),
                    const SizedBox(height: 8.0),
                    FormData(
                      width: double.infinity,
                      readOnly: false,
                      lines: 1,
                      controller: _experience,
                      label: "Experience",
                      obscureText: false,
                      val: (value) {
                        if (value!.isEmpty || value == null) {
                          return ('Please enter experience');
                        }
                        return null;
                      },
                      saved: (value) {
                        _experience.text = value;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      ("Training/Certification*"),
                    ),
                    const SizedBox(height: 8.0),
                    FormData(
                      width: double.infinity,
                      readOnly: false,
                      lines: 1,
                      controller: _certification,
                      label: "Training or cerfitication",
                      obscureText: false,
                      val: (value) {
                        if (value!.isEmpty || value == null) {
                          return ('Please enter training or certification');
                        }
                        return null;
                      },
                      saved: (value) {
                        _certification.text = value;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      ("Achievements*"),
                    ),
                    const SizedBox(height: 8.0),
                    FormData(
                      width: double.infinity,
                      readOnly: false,
                      lines: 1,
                      controller: _achievements,
                      label: "Achievements",
                      obscureText: false,
                      val: (value) {
                        if (value!.isEmpty || value == null) {
                          return ('Please enter achievements');
                        }
                        return null;
                      },
                      saved: (value) {
                        _achievements.text = value;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Project Details",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Projects*'),
                    const SizedBox(
                      height: 8,
                    ),
                    FormData(
                      width: double.infinity,
                      readOnly: false,
                      lines: 3,
                      controller: _projectDetail,
                      label: "Project detail",
                      obscureText: false,
                      val: (value) {
                        if (value!.isEmpty || value == null) {
                          return ('Please enter project detail');
                        }
                        return null;
                      },
                      saved: (value) {
                        _projectDetail.text = value;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 120,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ))),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              model['createdAt'] = FieldValue.serverTimestamp();
                              model['name'] = _name.text.toString().trim();
                              model['email'] = _email.text.toString().trim();
                              model['gender'] = _gender.text.toString().trim();
                              model['dob'] = _dob.text.toString().trim();
                              model['phone'] = _phone.text.toString().trim();
                              model['address'] =
                                  _address.text.toString().trim();
                              model['hobbies'] =
                                  _hobbies.text.toString().trim();
                              model['qualification'] =
                                  _qualification.text.toString().trim();
                              model['certification'] =
                                  _certification.text.toString().trim();
                              model['achievements'] =
                                  _achievements.text.toString().trim();
                              model['experience'] =
                                  _experience.text.toString().trim();
                              model['skills'] = _skills.text.toString().trim();
                              model['projects'] =
                                  _projectDetail.text.toString().trim();

                              setState(() {
                                isLoading = true;
                              });
                              await FirebaseFirestore.instance
                                  .collection("data")
                                  .doc(_phone.text)
                                  .set(model)
                                  .then((value) {
                                Fluttertoast.showToast(
                                    msg: "Saved Successfully");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PdfView(data: model)));
                              });

                              setState(() {
                                isLoading = false;
                              });
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Please enter all fields!");
                            }
                          },
                          child: isLoading == true
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : const Text('Save & Next')),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
