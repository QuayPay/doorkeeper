function(doc) {
  if(doc.type === 'dk_at') {
    emit([doc.refresh_token]);
  }
}
