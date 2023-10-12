//
//  HabitInputPage.swift
//  Zupper
//
//  Created by nithish-17632 on 04/09/23.
//

import Foundation
import UIKit

class HabitInput: UIViewController,UITableViewDelegate,UITableViewDataSource {//UIPickerViewDelegate, UIPickerViewDataSource,

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ZHabitTVC.identifier) as! ZHabitTVC
        cell.label.text = "Hi"
        return cell
    }
    
    
    // Create UI components
//    let dateTimePicker: UIDatePicker = {
//        let picker = UIDatePicker()
//        picker.datePickerMode = .dateAndTime
////        picker.tintColor = .label
//        picker.translatesAutoresizingMaskIntoConstraints = false
//        return picker
//    }()
//
//    let pickListView: UIPickerView = {
//        let picker = UIPickerView()
//        picker.tintColor = .label
//        picker.translatesAutoresizingMaskIntoConstraints = false
//        return picker
//    }()
//
//    let notesTextView: UITextView = {
//        let textView = UITextView()
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        textView.layer.borderWidth = 1.0
//        textView.layer.borderColor = UIColor.lightGray.cgColor
//        textView.layer.cornerRadius = 5.0
//        return textView
//    }()
//
//    // Data for the picklist
//    let pickListData = ["Option 1", "Option 2", "Option 3", "Option 4"]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Set the background color
//        view.backgroundColor = .systemBackground
//
//        // Add UI components to the view
//        view.addSubview(dateTimePicker)
//        view.addSubview(pickListView)
//        view.addSubview(notesTextView)
//
//        // Set up constraints for the UI components
//        NSLayoutConstraint.activate([
//            dateTimePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            dateTimePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            dateTimePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//
//            pickListView.topAnchor.constraint(equalTo: dateTimePicker.bottomAnchor, constant: 20),
//            pickListView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            pickListView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            pickListView.heightAnchor.constraint(equalToConstant: 150),
//
//            notesTextView.topAnchor.constraint(equalTo: pickListView.bottomAnchor, constant: 20),
//            notesTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            notesTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            notesTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
//        ])
//
//        // Set the delegate and data source for the picklist
//        pickListView.delegate = self
//        pickListView.dataSource = self
//    }
//
//    // MARK: - UIPickerViewDataSource and UIPickerViewDelegate methods
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1 // Number of components in the picklist (e.g., 1 for a single-column picklist)
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return pickListData.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return pickListData[row]
//    }
    
    
    private lazy var habitTableView = ZHabitTVC()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        habitTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(habitTableView)
        habitTableView.backgroundColor = .cyan
        
        NSLayoutConstraint.activate([
            habitTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            habitTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            habitTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}


/*
 @ -84,8 +84,10 @@ class ZCRMEmailAttachmentCollectionView: UICollectionView, UICollectionViewDeleg
     func configure(cell: ZCRMEmailAttachmentCollectionViewCell, indexPath: IndexPath) -> Void {
         let attachment = attachments[indexPath.row]
         cell.titleLabel.text = attachment.name
         checkError(cell: cell, attachment: attachment)
         cell.updateProgress(progress: attachment.progress)
         
         // in checkError we are removing progress bar
         checkError(cell: cell, attachment: attachment)
         cell.attachmentIcon.image = attachment.fileType.fileTypeIcon
         updateDeleteState(cell: cell, row: indexPath.row, attachment: attachment)
         updateRetryState(cell: cell, row: indexPath.row, attachment: attachment)
 @ -114,13 +116,13 @@ class ZCRMEmailAttachmentCollectionView: UICollectionView, UICollectionViewDeleg
         guard let error = attachment.uploadError else {
             cell.setSize(value: attachment.size)
             cell.descriptionLabel.textColor = ZCRMComposeThemeManager.shared.getSecondaryTextColor()
             cell.toggle(inError: false)
             cell.removeRetryButton()
             return
         }
         cell.descriptionLabel.text = error
         cell.descriptionLabel.textColor = .red
         cell.toggle(inError: true)
         cell.retryButton.isHidden = false
         cell.progressView.isHidden = true
         cell.addRetryButton()
     }
     
     func calculateSize() -> CGSize {
 @ -146,6 +148,10 @@ class ZCRMEmailAttachmentCollectionView: UICollectionView, UICollectionViewDeleg
     }
     
     @objc private func retryAttachment(_ sender: UIButton) -> Void {
         if (!ZCRMComposeManager.shared.isNetworkAvailable()) {
             ZCRMComposeManager.shared.showToast(message: EmailL10NKey.zDocsNoNetworkConnection.value)
             return
         }
         let index = sender.tag
         guard index < attachments.count,
             let attachDelegate = attachmentDelegate else {
 @ -153,7 +159,7 @@ class ZCRMEmailAttachmentCollectionView: UICollectionView, UICollectionViewDeleg
         }
         let indexPath = IndexPath(item: index, section: 0)
         let cell = self.cellForItem(at: indexPath) as! ZCRMEmailAttachmentCollectionViewCell
         cell.toggle(inError: false)
         cell.removeRetryButton()
         attachDelegate.didRetry(attachment: attachments[index], at: index)
     }
     
 @@ -36,8 +36,8 @@ class ZCRMEmailAttachmentCollectionViewCell: UICollectionViewCell {
     
     lazy var deleteButton: UIButton = {
         let button = UIButton()
         button.setImage(ZCRMComposeThemeManager.shared.getMailAttachmentDeleteImage(), for: .normal)
 //        button.setImage(ZCRMThemeManagerWrapper.sharedInstance.swipeDeleteIcon, for: .normal)
 //        button.setImage(ZCRMComposeThemeManager.shared.getMailAttachmentDeleteImage(), for: .normal)
         button.setImage(ZCRMThemeManagerWrapper.sharedInstance.swipeDeleteIcon, for: .normal)
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
 @ -46,8 +46,6 @@ class ZCRMEmailAttachmentCollectionViewCell: UICollectionViewCell {
            let button = UIButton()
             button.translatesAutoresizingMaskIntoConstraints = false
             button.setImage(ZCRMThemeManagerWrapper.sharedInstance.attachmentRetryImage, for: .normal)
 //        button.addTarget(self, action: #selector(didRetryButtonTapped), for: .touchUpInside)
         button.isHidden = true
            return button
         }()

 @ -87,7 +85,7 @@ class ZCRMEmailAttachmentCollectionViewCell: UICollectionViewCell {
         addSubview(deleteButton)
         addSubview(progressView)
         addSubview(infiniteProgress)
         addSubview(retryButton)
 //        addSubview(retryButton)
         layer.masksToBounds = true
         setConstraint()
         
 @ -115,10 +113,10 @@ class ZCRMEmailAttachmentCollectionViewCell: UICollectionViewCell {
             deleteButton.heightAnchor.constraint(equalToConstant: 38),
             deleteButton.centerYAnchor.constraint(equalTo: centerYAnchor),
             
             retryButton.rightAnchor.constraint(equalTo: deleteButton.leftAnchor,constant: -4),
             retryButton.widthAnchor.constraint(equalTo: deleteButton.widthAnchor),
             retryButton.heightAnchor.constraint(equalTo: deleteButton.widthAnchor),
             retryButton.centerYAnchor.constraint(equalTo: centerYAnchor),
 //            retryButton.rightAnchor.constraint(equalTo: deleteButton.leftAnchor,constant: -4),
 //            retryButton.widthAnchor.constraint(equalTo: deleteButton.widthAnchor),
 //            retryButton.heightAnchor.constraint(equalTo: deleteButton.widthAnchor),
 //            retryButton.centerYAnchor.constraint(equalTo: centerYAnchor),
             
             
             progressView.leadingAnchor.constraint(equalTo: leadingAnchor),
 @ -167,19 +165,39 @@ class ZCRMEmailAttachmentCollectionViewCell: UICollectionViewCell {
         completeLoading = true
         infiniteProgress.isHidden = true
     }
     //name should change
     func toggle(inError: Bool) {
     
     func addRetryButton(){
         toggleReloadButton(true)
     }
     
     func removeRetryButton(){
         toggleReloadButton(false)
     }
     
     private func setRetryButtonConstraints(){
         addSubview(retryButton)
         NSLayoutConstraint.activate([
             retryButton.rightAnchor.constraint(equalTo: deleteButton.leftAnchor,constant: -4),
             retryButton.widthAnchor.constraint(equalTo: deleteButton.widthAnchor),
             retryButton.heightAnchor.constraint(equalTo: deleteButton.widthAnchor),
             retryButton.centerYAnchor.constraint(equalTo: centerYAnchor),
         ])
     }
     
     private func toggleReloadButton(_ shouldAdd: Bool) {
         titleRightConstraints?.isActive = false
         
         if inError {
             titleRightConstraints = titleLabel.rightAnchor.constraint(equalTo: retryButton.leftAnchor, constant: -4)
         if shouldAdd {
             retryButton.isHidden = false
             setRetryButtonConstraints()
             titleRightConstraints = titleLabel.rightAnchor.constraint(equalTo: retryButton.leftAnchor, constant: -4)
         } else {
             titleRightConstraints = titleLabel.rightAnchor.constraint(equalTo: deleteButton.leftAnchor, constant: -8)
             retryButton.isHidden = true
             if retryButton.superview != nil {retryButton.removeFromSuperview()}
             titleRightConstraints = titleLabel.rightAnchor.constraint(equalTo: deleteButton.leftAnchor, constant: -8)
         }
         
         titleRightConstraints?.isActive = true
         self.layoutIfNeeded()
     }

 }
 @ -70,7 +70,8 @@ enum EmailL10NKey {
     case smtpError
     case recordLockingRestrictedActionError
     case networkInterrupted
     
     case attachementsUploading
     case uploadAndSend
     var value: String {
         switch self {
         case .chooseTemplate:
 @ -171,6 +172,12 @@ enum EmailL10NKey {
             return L10N(RECORD_LOCKING_RESTRICTED_ACTION_ERROR)
         case .networkInterrupted:
             return L10N(COMPOSEMAIL_ALERT_MESSAGE_NETWORKINTERRUPTED)
             
         case .attachementsUploading:
             return "Uploading"
             
         case .uploadAndSend:
             return "Upload And Send"
         }
     }
 }
 @ -502,7 +509,8 @@ extension ZCRMEmailComposePresenter: ZMailComposePresenterProtocol {
     func uploadFile(attachment:ZAttachment, inline: Bool) {
         if attachment.data != nil, let transactionId = attachment.transactionId {
             let transactionTime = ZCRMComposeManager.shared.getUniqueIdFromResponseTime()
             let source: DataSource = ZCRMComposeManager.shared.isNetworkAvailable() ? .remote : .local
 //            let source: DataSource = ZCRMComposeManager.shared.isNetworkAvailable() ? .remote : .local
             let source: DataSource = .remote
             let transaction = ComposeEmailTransaction(id: transactionId, time: transactionTime, operationType: ZCRMOperationTypeUploadEmailAttachment.rawValue)
             let mailTransaction = ComposeEmailTransaction(id: mailTransactionId, time: mailTransactionTime, operationType: ZCRMOperationTypeSendMailV2.rawValue)
             let request = UploadEmailAttachments.Request(attachment: attachment, transaction: transaction, mailTransaction: mailTransaction, source: source)
 @ -517,6 +525,9 @@ extension ZCRMEmailComposePresenter: ZMailComposePresenterProtocol {
             }, onError: { [weak self] (error) in
                 guard let errorMessage = self?.getUploadErrorMessage(error: error) else { return }
                 self?.viewController?.didFailAttachmentUpload(tempId: request.attachment.tempId, inline: request.attachment.type == .inline, error: errorMessage)
                 self?.isUploadInProgress = false
 //                self?.viewController?.readyToUpload = false
 //                self?.viewController?.uploadingAttachmentStatus = .pendingForSubjectSelection
             })
         }
     }

 @ -31,7 +31,13 @@ enum EmailComposeAttachmentConstants {
     static let ComposeAttachmentTotalSize = 1024 * 1024 * 10
     static let ComposeAttachmentTotalSizeInMB = ComposeAttachmentTotalSize / (1024 * 1024)
 }

 enum AttachmentUploadPendingStatus{
     case nonReady
     case uploading
     case pendingForSubjectSelection
     case noSubjectSelected
     case subjectSelected
 }
 enum EmailComposeConstants {
     static let inlineImageURL = "https://crm.zoho.com/crm/viewInLineImage?fileContent="
     static let publicInlineImageURL = "crm\\\\\\img_id:"
 @ -122,7 +128,15 @@ enum ComposeJavaScript: JavaScriptRepresentable {
 class ZCRMEmailComposeViewController: ZCRMUIViewController, EditingProgressProtocol {
     
     let isEditingInProgress = true
     
     var isSubjectExist:Bool = false
     var isUploadAndSendTapped:Bool = false
     var uploadingAttachmentCount:Int = 0{
         didSet{
             if isUploadAndSendTapped {
                 uploadAndSend()
             }
         }
     }
     private lazy var scrollView: UIScrollView =  {
         let scrollView = UIScrollView()
         scrollView.backgroundColor = ZCRMComposeThemeManager.shared.getBaseScrollColor()
 @ -1485,24 +1499,80 @@ class ZCRMEmailComposeViewController: ZCRMUIViewController, EditingProgressProto
         }
         return true
     }
     
     private func uploadAndSend() -> Void {
         if isSubjectExist == false {
             isSubjectExist = checkForSubjectFieldWithoutAttachment()
         }
         
         if isSubjectExist {
             if uploadingAttachmentCount == 0 {
                 showLoadingView(titleKey: .sendingMail)
                 sendMail()
                 isUploadAndSendTapped = false
             }
         } else{
             hideLoadingView()
             isUploadAndSendTapped = false
             isSubjectExist = false
         }
     }
     func checkForFailedAttachment() -> Bool {
         guard attachmentsView.getAllAttachments().first(where: { $0.uploadError != nil }) != nil else {
             return true
         }
         let alert = UIAlertController(title: nil, message: EmailL10NKey.attachmentFailedSendAnyway.value, preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: EmailL10NKey.cancel.value, style: .default, handler: nil))
        
         // title should change
         alert.addAction(UIAlertAction(title:  "Upload and send", style: .default, handler: { [weak self] (alertAction) in
             guard let attachments = self?.attachmentsView.getAllAttachments() else {
                 return
             }
             self?.showLoadingView(titleKey: .attachementsUploading)
             self?.isSubjectExist = false
             self?.isUploadAndSendTapped = false
             self?.uploadingAttachmentCount = 0
             self?.isUploadAndSendTapped = true
            
          
             for attachment in attachments {
                 if attachment.uploadError != nil {
                     self?.uploadingAttachmentCount += 1
                     self?.uploadAttachment(attachment)
                 }
             }
 //            guard self?.checkForSubjectField() ?? false else { return }
             
         }))
         alert.addAction(UIAlertAction(title: EmailL10NKey.proceed.value, style: .default, handler: { [weak self] (alertAction) in
             self?.showLoadingView(titleKey: .sendingMail)
             guard self?.checkForSubjectField() ?? false else { return }
             self?.sendMail()
             
         }))
         alert.addAction(UIAlertAction(title: EmailL10NKey.cancel.value, style: .cancel, handler: nil))
         hideLoadingView()
         present(alert, animated: true, completion: nil)
         return false
     }
     
     private func uploadAllErroredAttachments(){
         let attachments = self.attachmentsView.getAllAttachments()
         var uploadingCount = attachments.filter{attachment in return attachment.id == nil}.count
         if uploadingCount != 0 {
             self.showLoadingView(titleKey: .attachementsUploading)
             uploadingCount = attachments.filter{ attachment in
                 return attachment.uploadError != nil
             }.count
 //            self.isUploadAndSendTapped = true
             if uploadingCount != 0 {
                 for attachment in attachments {
                     if attachment.uploadError != nil {
                         self.uploadAttachment(attachment)
                     }
                 }
             }
         }
             
     }
     func checkForSubjectField() -> Bool {
         guard addressView.subjectView.textField.text?.count ?? 0 > 0  else {
             let alert = UIAlertController(title: STRING_EMPTY, message: EmailL10NKey.noSubject.value, preferredStyle: .alert)
 @ -1517,7 +1587,28 @@ class ZCRMEmailComposeViewController: ZCRMUIViewController, EditingProgressProto
         }
         return true
     }
     
     func checkForSubjectFieldWithoutAttachment() -> Bool {
         guard IsEmpty(addressView.subjectView.textField.text) == false else {
             let alert = UIAlertController(title: STRING_EMPTY, message: EmailL10NKey.noSubject.value, preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: EmailL10NKey.cancel.value, style: .default, handler:{  [weak self] (alertAction) in
                 self?.hideLoadingView()
                 self?.isSubjectExist = false
             }))
             alert.addAction(UIAlertAction(title: EmailL10NKey.okay.value, style: .default, handler:{  [weak self] (alertAction) in
                 if IsNetworkConnectionAvailable(){
                     self?.isSubjectExist = true
                     self?.isUploadAndSendTapped = true
                     self?.uploadAllErroredAttachments()
                 }else{
                     ZCRMComposeManager.shared.showToast(message: EmailL10NKey.noInternetConnection.value)
                 }
             }))
             present(alert, animated: true, completion: nil)
             return false
             
         }
         return true
     }
     func checkForPrimaryEmailID() -> Bool  {
         let primaryEmail = selectedFromEmail?.emailId ?? STRING_EMPTY
         if primaryEmail.insensitiveContains(APPLE_PRIVATERELAY_EMAIL) {
 @ -2139,6 +2230,7 @@ extension ZCRMEmailComposeViewController: ZCRMEmailComposeProtocol {
                 attachmentsView.updateAttachmentId(tempId: tempId, attachmentId: attachmentId)
             }
         }
         self.uploadingAttachmentCount = self.uploadingAttachmentCount - 1
     }
     
     func showAutoSuggestTable(data: [EmailAddress]?) {
 @ -2182,6 +2274,10 @@ extension ZCRMEmailComposeViewController: ZCRMEmailComposeProtocol {
     
     func didFailAttachmentUpload(tempId: String, inline: Bool, error: String) {
         guard inline else {
             self.isUploadAndSendTapped = false
             self.isSubjectExist = false
             self.hideLoadingView()
             ZCRMComposeManager.shared.showToast(message: EmailL10NKey.zDocsNoNetworkConnection.value)
             attachmentsView.uploadFailed(tempId: tempId, error: error)
             return
         }

 */
