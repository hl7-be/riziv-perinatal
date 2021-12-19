
Logical: PerinatalDeafnessScreening
Id: be-model-perinataldeafnessscreening
Title:          "Perinatal deafness screening logical model"
Description:    "Perinatal deafness screening logical model"
* id 0..* Identifier "Unique ID for test results" "Unique ID for test results"
// Added id 0..* - ok?
* patient 1..1 Reference "Unique ID or reference for the patient" "Unique ID for the patient - the SSIN and/or other identifiers"
* recorder 1..1 Reference "Unique ID or reference for the recorder" "Unique ID for the professional that records the results"
// recorder or reporter? Just a reminder to use consistently
* performer 0..1 Reference "Unique ID or reference for the performer" "Unique ID for the professional that performs the procedure"

* observationTimeStamp 1..1 dateTime "Date & Time of the result" "Date & Time of the result"
// was observationDate - but I'd prefer to use resultTimeStamp

* recordedTimeStamp 1..1 dateTime "Date & Time of the record entry" "Date & Time of the record entry"

* device 0..1 BackboneElement "The device used to make the test" "The device used to make the test"
// to do: AEFMPS - UDI
  * deviceCode 0..1 Identifier "Device code" "Device code"
  * lotNumber 0..1 string "Lot number" "Lot number"
  * serialNumber 0..1 string "Serial number" "Serial number"

* status 0..1 code "Status of the procedure" "Status of the procedure"
// was CodeableConcept, should be code

* statusReason 0..1 CodeableConcept "The reason for the status" "The reason for the status"
// renamed to statusReason

* testCode 0..* Coding "Type of test performed" "Type of test performed (AEP, TEOAE, DPOAE, UNKNOWN)"
* testSequence 1..1 Coding "Sequence of the test - first, second..." "Sequence of the test - first, second..."

* results 0..* BackboneElement "The test results" "The test results"
  * resultType 0..1 Coding "The result type code" "No results, cancelled, Refer, pass, double refer"
  // is this needed?
  * resultLocation 0..* CodeableConcept "The body site" "Body site"
  // was BodyLocalisation  - should it be bodySite for alignment with other profiles?
  // why 0..* ? It's more likely to have 2 ears, left and right. not 2 locations..
  * bodyLaterality 0..1 CodeableConcept "Left or Right" "Left or Right"

  * resultValue 1..1 CodeableConcept "Actual test result" "Actual test result"
  * resultCertitude 1..1 Coding "Degree of certainty of accurate results" "Degree of certainty of accurate results. Allows noting that the result may not be very certain for any given reason"

* conclusion 0..1 string "Conclusion or interpretation from the results" "Conclusion or interpretation from the results"
* remark 0..* string "Additional remarks about the procedure" "Additional remarks about the procedure"


/*
* reportEntry 0..* code "Manual data entry or system extract" "Manual data entry or system extract"
* dataBlocks 0..* string "Data from Echolink" "Data from Echolink"

* relevantHistory 0..* BackboneElement "Relevant history" "Relevant history"
  * author 0..1 Reference "The creator of the result" "The creator of the result"
  * date 0..1 dateTime "The date of creation" "The date of creation"
  * modification 0..* BackboneElement "Change history" "Change history"
    * recorder 1..1 Reference "The author of the modification" "The author of the modification"
    * date 1..1 dateTime "The date of the modification" "The date of the modification"
*/
