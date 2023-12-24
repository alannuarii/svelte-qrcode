<script>
	import QRCode from 'qrcode';
	import { onMount } from 'svelte';

	let qrCode;
	let url = 'google.com';
	$: options = {
		errorCorrectionLevel: 'H',
		type: 'image/png',
		quality: 1,
		margin: 3,
		scale: 5,
		width: 300,
		color: {
			dark: '#000000',
			light: '#FFFFFF'
		}
	};

	const generateQR = async () => {
		qrCode = await QRCode.toDataURL(url, options);
	};

	const clear = () => {
		url = '';
	};

	onMount(() => {
		generateQR();
	});
</script>

<svelte:head>
	<title>QR Code</title>
</svelte:head>

<main>
	<div class="container-lg container-fluid position-absolute top-50 start-50 translate-middle">
		<div class="card rounded-5 p-5 bg-primary-subtle shadow">
			<h1 class="text-center mb-4">QR CODE GENERATOR CUY</h1>
			<div class="d-flex">
				<input
					type="text"
					class="url form-control form-control-lg text-center rounded-5"
					bind:value={url}
					on:input={generateQR}
				/>
				<div class="px-3 d-flex justify-content-center align-items-center">
					<div class="text-center">
						<!-- svelte-ignore a11y-click-events-have-key-events -->
						<i class="bi-x-circle-fill text-danger-emphasis" on:click={clear} />
						<h6>Clear</h6>
					</div>
				</div>
			</div>

			<div class="row mt-4">
				<div class="col-lg-7 mb-3">
					<div class="card p-3 rounded-5">
						<div class="mb-5 text-center">
							<label for="customRange3" class="form-label">Margin</label>

							<input
								type="range"
								class="form-range"
								min="1"
								max="5"
								step="1"
								id="customRange3"
								bind:value={options.margin}
								on:input={generateQR}
							/>
						</div>
						<div class="row mb-5">
							<div class="col-lg-6 d-flex align-items-center flex-column">
								<label for="exampleColorInput" class="form-label">QR Code Color</label>
								<input
									type="color"
									class="form-control form-control-color"
									id="exampleColorInput"
									bind:value={options.color.dark}
									on:input={generateQR}
								/>
							</div>
							<div class="col-lg-6 d-flex align-items-center flex-column">
								<label for="exampleColorInput" class="form-label">Background Color</label>
								<input
									type="color"
									class="form-control form-control-color"
									id="exampleColorInput"
									bind:value={options.color.light}
									on:input={generateQR}
								/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 offset-lg-1">
					<div class="card border bg-dark-subtle py-2 px-4 rounded-5 mb-2">
						<img src={qrCode} class="my-3" alt="QRCode" />
					</div>
					<div class="d-flex justify-content-center">
						<a href={qrCode} download="qrcode.png" class="btn btn-primary rounded-5 px-3 py-2">Download</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<style>
	.url {
		font-size: 20px;
		padding: 30px 30px;
	}
	i {
		font-size: 30px;
		cursor: pointer;
	}
	h6 {
		margin-top: -5px;
		font-size: 13px;
		font-weight: 400;
	}
</style>
