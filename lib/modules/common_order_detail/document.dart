
class Document {
    dynamic docId;
    String? docType;
    String? expireDate;
    dynamic docIssueCountry;
    String? docIssueDate;
    String? docHolderNationality;

    Document({this.docId, this.docType, this.expireDate, this.docIssueCountry, this.docIssueDate, this.docHolderNationality});

    Document.fromJson(Map<String, dynamic> json) {
        docId = json['docID'];
        if(json['docType'] is String) {
            docType = json['docType'];
        }
        if(json['expireDate'] is String) {
            expireDate = json['expireDate'];
        }
        docIssueCountry = json['docIssueCountry'];
        if(json['docIssueDate'] is String) {
            docIssueDate = json['docIssueDate'];
        }
        if(json['docHolderNationality'] is String) {
            docHolderNationality = json['docHolderNationality'];
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['docID'] = docId;
        _data['docType'] = docType;
        _data['expireDate'] = expireDate;
        _data['docIssueCountry'] = docIssueCountry;
        _data['docIssueDate'] = docIssueDate;
        _data['docHolderNationality'] = docHolderNationality;
        return _data;
    }
}