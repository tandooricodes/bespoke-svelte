<script>
	import { setContext } from 'svelte';

	/** @type {{
	 *   children?: import('svelte').Snippet,
	 *   class?: string,
	 *   multiple?: boolean,
	 *   value?: string | string[],
	 *   onValueChange?: (value: string | string[]) => void,
	 *   disabled?: boolean,
	 *   [key: string]: any
	 * }} */
	let {
		children,
		class: className,
		multiple = false,
		value = $bindable(''),
		onValueChange,
		disabled = false,
		...restProps
	} = $props();

	let open = $state(false);
	let selectedLabel = $state('');
	let filter = $state('');

	/** @type {Array<{ value: string, label: string }>} */
	let items = $state([]);

	const visibleItems = $derived(
		items.filter((item) => !filter || item.label.toLowerCase().includes(filter.toLowerCase()))
	);

	const selectedItems = $derived(
		multiple
			? /** @type {string[]} */ (value).map((v) => ({
					value: v,
					label: items.find((i) => i.value === v)?.label ?? v
				}))
			: []
	);

	/** @type {HTMLDivElement | undefined} */
	let rootEl = $state();

	/** @param {MouseEvent} e */
	function handleWindowClick(e) {
		if (!rootEl) return;
		if (!rootEl.contains(/** @type {Node} */ (e.target))) {
			open = false;
			filter = '';
		}
	}

	/** @param {KeyboardEvent} e */
	function handleWindowKeydown(e) {
		if (e.key === 'Escape') {
			open = false;
			filter = '';
		}
	}

	setContext('combobox', {
		get open() {
			return open;
		},
		get value() {
			return value;
		},
		get selectedLabel() {
			return selectedLabel;
		},
		get selectedItems() {
			return selectedItems;
		},
		get filter() {
			return filter;
		},
		get disabled() {
			return disabled;
		},
		get multiple() {
			return multiple;
		},
		get visibleCount() {
			return visibleItems.length;
		},
		toggle() {
			if (disabled) return;
			open = !open;
			if (!open) filter = '';
		},
		close() {
			open = false;
			filter = '';
		},
		/** @param {string} q */
		setFilter(q) {
			filter = q;
		},
		/** @param {string} v @param {string} label */
		selectItem(v, label) {
			if (multiple) {
				const arr = /** @type {string[]} */ (value);
				const idx = arr.indexOf(v);
				value = idx === -1 ? [...arr, v] : arr.filter((x) => x !== v);
				onValueChange?.(value);
			} else {
				value = v;
				selectedLabel = label;
				open = false;
				filter = '';
				onValueChange?.(v);
			}
		},
		/** @param {string} v */
		removeItem(v) {
			if (!multiple) return;
			value = /** @type {string[]} */ (value).filter((x) => x !== v);
			onValueChange?.(value);
		},
		/** @param {{ value: string, label: string }} item */
		registerItem(item) {
			if (!items.find((i) => i.value === item.value)) {
				items.push(item);
			}
		},
		/** @param {string} v */
		unregisterItem(v) {
			const idx = items.findIndex((i) => i.value === v);
			if (idx !== -1) items.splice(idx, 1);
		}
	});
</script>

<svelte:window onclick={handleWindowClick} onkeydown={handleWindowKeydown} />

<div bind:this={rootEl} class="relative {className ?? ''}" {...restProps}>
	{@render children?.()}
</div>
