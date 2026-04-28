<script>
	import { setContext } from 'svelte';

	/** @type {{
	 *   children?: import('svelte').Snippet,
	 *   class?: string,
	 *   value?: string,
	 *   onValueChange?: (value: string) => void,
	 *   disabled?: boolean,
	 *   [key: string]: any
	 * }} */
	let {
		children,
		class: className,
		value = $bindable(''),
		onValueChange,
		disabled = false,
		...restProps
	} = $props();

	let open = $state(false);
	let selectedLabel = $state('');

	/** @type {HTMLDivElement | undefined} */
	let rootEl = $state();

	/** @param {MouseEvent} e */
	function handleWindowClick(e) {
		if (!rootEl) return;
		if (!rootEl.contains(/** @type {Node} */ (e.target))) {
			open = false;
		}
	}

	/** @param {KeyboardEvent} e */
	function handleWindowKeydown(e) {
		if (e.key === 'Escape') open = false;
	}

	setContext('select', {
		get open() {
			return open;
		},
		get value() {
			return value;
		},
		get selectedLabel() {
			return selectedLabel;
		},
		get disabled() {
			return disabled;
		},
		toggle() {
			if (!disabled) open = !open;
		},
		close() {
			open = false;
		},
		/** @param {string} v @param {string} label */
		selectItem(v, label) {
			value = v;
			selectedLabel = label;
			open = false;
			onValueChange?.(v);
		}
	});
</script>

<svelte:window onclick={handleWindowClick} onkeydown={handleWindowKeydown} />

<div bind:this={rootEl} class="relative {className ?? ''}" {...restProps}>
	{@render children?.()}
</div>
