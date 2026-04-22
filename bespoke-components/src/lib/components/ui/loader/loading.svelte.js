export const loadingStore = $state({ isLoading: true });

export function startLoading() {
	loadingStore.isLoading = true;
}

export function stopLoading() {
	loadingStore.isLoading = false;
}
