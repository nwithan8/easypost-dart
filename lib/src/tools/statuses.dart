/// Returns true if the status is 'cancelled' or 'canceled'
/// API is inconsistent with the spelling of the word.
bool isCanceled(String status) {
  return status.toLowerCase() == 'cancelled' ||
      status.toLowerCase() == 'canceled';
}
